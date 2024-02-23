return {
    "williamboman/mason.nvim",
    cmd = "Mason", -- use :Mason in vim to invoke this plugin
    event = "BufReadPre", -- load before buffer read
    config = {            -- config is passed to require("mason").setup(..)
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
}
