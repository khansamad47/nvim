-- keymaps.lua
vim.api.nvim_set_keymap("i", "jj", "<Esc>", 
	{ noremap = true, silent = true }
)

-- For bbg cpp formatting
vim.api.nvim_set_keymap("v", "<Leader>i",
    ":!/opt/bb/bin/bde-format-18<CR>",
    { noremap = true, silent = false }
)
vim.api.nvim_set_keymap("n", "<Leader>I",
    ":% !/opt/bb/bin/bde-format-18<CR>",
    { noremap = true, silent = false }
)
