return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		-- Instead of find_files I am using git_files
    	vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    	vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Fuzzy find files in cwd" })
    	vim.keymap.set("n", "<leader>f/", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    	vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
	end
}
