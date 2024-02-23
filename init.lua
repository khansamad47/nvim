-- Load globals
require("core.globals")

-- Load keymaps
require("core.keymaps")

-- Load options
require("core.options")

-- Setting up lazyvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- .. is string contactination operator
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{ import = "plugins" },{ import = "plugins.lsp"}}, opts)
