return { 
	"ellisonleao/gruvbox.nvim",
	priority = 1000,    -- default priority is 50 | 1000 is very high
	lazy = false,       -- will be loaded sync
	config = function() -- config fn will be called after plugin is loaded
		vim.cmd("colorscheme gruvbox")
	end
	, 
	opts = ...
}
