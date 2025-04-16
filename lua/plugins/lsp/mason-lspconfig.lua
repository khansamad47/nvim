return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "clangd",
            -- "kotlin_language_server",
            "lua_ls",
            "pyright",
            "neocmake",
        },
        automatic_installation = false, -- For Bloomberg
    },
    event = "BufReadPre", -- load before buffer read
    dependencies = "williamboman/mason.nvim",
}
