return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require('lint')

        lint.linters.dummy_linter = {
          cmd = '/usr/bin/echo',
          stdin = true,
          args = {"dummy_linter-lint-nvim-test-only"},
          stream = 'stdout', -- to fit into error output parsing if needed
          ignore_exitcode = false,
          parser = function(output, _)
            return {
              {
                lnum = 0,  -- First line (index 0 in Lua)
                col = 0,
                severity = vim.diagnostic.severity.ERROR,
                message = output,  -- Custom error message
              },
            }
          end,
        }

        require('lint').linters.bde_verify = {
          cmd = 'bde_verify',        -- Ensure bde_verify is in your PATH
          stdin = false,
          args = {},                 -- Add any needed arguments for bde_verify
          ignore_exitcode = true,
          parser = function(output, bufnr)
            local diagnostics = {}
            for line in vim.gsplit(output, '\n', true) do
              -- Example line format we want to match:
              -- groups/bdl/bdlb/bdlb_randomdevice.h:17:62: warning: TW01: Possibly prefer 'that' over 'which'
              local file, lnum, col, severity, code, message = line:match("^(.*):(%d+):(%d+):%s+(%w+):%s+(%w+):%s+(.*)$")
              if file and lnum and col and severity and code and message then
                local sev = (severity:lower() == 'error') and vim.diagnostic.severity.ERROR or vim.diagnostic.severity.WARN
                table.insert(diagnostics, {
                  bufnr = bufnr,
                  lnum = tonumber(lnum) - 1,   -- zero-based line indexing
                  col = tonumber(col) - 1,     -- zero-based column indexing
                  severity = sev,
                  source = 'bde_verify',
                  message = message .. " [" .. code .. "]",  -- Append code at the end if desired
                })
              end
            end
            return diagnostics
          end,
        }

        lint.linters_by_ft = {
            -- cpp = { "dummy_linter" },
            -- cpp = { "bde_verify" },
        }
        -- Set up an autocommand to trigger linting on file save
        -- vim.api.nvim_create_autocmd("BufWritePost", {
        vim.api.nvim_create_autocmd({"BufWritePost","BufReadPost"}, {
          callback = function()
            require("lint").try_lint()  -- Necessary to call linting
          end,
        })
    end,
    event = "BufReadPre",  -- Set up to trigger on save
}

