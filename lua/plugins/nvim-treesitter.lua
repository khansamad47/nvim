return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({ -- enable syntax highlighting
            highlight = {
                enable = true,
            },
            -- ensure these language parsers are installed
            ensure_installed = {
                "c",
                "cmake",
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "vimdoc",
                "dockerfile",
                "gitignore",
                "query",
            },
        })
    end
}
