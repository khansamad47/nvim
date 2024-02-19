vim.g.mapleader = " "
vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
vim.opt["number"] = true

-- Load keymaps
require("core.keymaps")

-- Configure clipboard
vim.cmd("set clipboard=unnamedplus")

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

require("lazy").setup("plugins", opts)
