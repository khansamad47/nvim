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

        lint.linters_by_ft = {
            -- cpp = { "dummy_linter" },
        }
        -- Set up an autocommand to trigger linting on file save
        vim.api.nvim_create_autocmd("BufWritePost", {
          callback = function()
            require("lint").try_lint()  -- Necessary to call linting
          end,
        })
    end,
    event = "BufReadPre",  -- Set up to trigger on save
}

