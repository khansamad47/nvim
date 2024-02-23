return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "clangd"
        },
        automatic_installation = true,
    },
    event = "BufReadPre", -- load before buffer read
    dependencies = "williamboman/mason.nvim",
}
