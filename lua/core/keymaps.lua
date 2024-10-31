-- keymaps.lua
vim.api.nvim_set_keymap("i", "jj", "<Esc>", 
	{ noremap = true, silent = true }
)

-- For bbg cpp formatting
vim.api.nvim_set_keymap("v", "<C-I>",
    ":!/opt/bb/bin/bde-format<CR>",
    { noremap = true, silent = true }
)
