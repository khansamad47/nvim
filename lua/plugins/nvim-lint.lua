return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require('lint')
        local project_root = os.getenv("SPACES__WORKAREA")

        lint.linters.bde_verify = {
          cmd = 'bde_verify',        -- Ensure bde_verify is in your PATH
          stdin = false,
          args = {"-std=c++20","-p", project_root .. "/build", "-config", project_root .. "/bde_verify.cfg"},
          ignore_exitcode = true,
          stream = 'stderr',
          parser = function(output, bufnr)
            local diagnostics = {}
            for line in vim.gsplit(output, '\n', true) do
              -- Example line format we want to match:
              -- groups/bdl/bdlb/bdlb_randomdevice.h:17:62: warning: TW01: Possibly prefer 'that' over 'which'
              -- local file, lnum, col, severity, code, message = line:match("^(.*):(%d+):(%d+):%s+(%w+):%s+(%w+):%s+(.*)$")
              local file, lnum, col, severity, message = line:match("^(.*):(%d+):(%d+):%s+(%w+):%s+(.*)$")
              if file and lnum and col and severity and message then
                if severity:lower() ~= "note" then
                    local sev = (severity:lower() == 'error') and vim.diagnostic.severity.ERROR or vim.diagnostic.severity.WARN
                    table.insert(diagnostics, {
                      bufnr = bufnr,
                      lnum = tonumber(lnum) - 1,   -- zero-based line indexing
                      col = tonumber(col) - 1,     -- zero-based column indexing
                      severity = sev,
                      source = 'bde_verify',
                      message = message,  -- Append code at the end if desired
                    })
                end
              end
            end
            return diagnostics
          end,
        }

        lint.linters_by_ft = {
            cpp = { "bde_verify" },
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
