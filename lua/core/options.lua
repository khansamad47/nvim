-- options.lua
-- `:set all` to display all options
-- `:options` to display current options settings

-- Tab / Indentation
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Search
vim.opt.hlsearch = true

-- Apperance
vim.opt.number = true         -- show line numbers
vim.opt.colorcolumn = '80'    -- column at 80
vim.opt.cursorline = true     -- highlight curson line

-- Behaviour
vim.opt.errorbells = false    -- error won't ring bell
vim.opt.iskeyword:append("-") -- "-" it not a work break
vim.opt.clipboard:append("unnamedplus")
vim.opt.splitright = true     -- vertical split is on the right
vim.opt.splitbelow = true     -- horizontal split is on the bottom
vim.opt.encoding = "UTF-8"    -- buffer encoding is UTF-8

