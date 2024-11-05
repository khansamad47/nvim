return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "clangd",
            -- "kotlin_language_server",
            "pyright",
            "lua_ls",
        },
        automatic_installation = false, -- For Bloomberg
    },
    event = "BufReadPre", -- load before buffer read
    dependencies = "williamboman/mason.nvim",
}
