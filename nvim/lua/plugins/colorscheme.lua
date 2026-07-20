return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				styles = {
					transparency = true,
				},
			})

			vim.cmd.colorscheme("rose-pine")
		end,
	},

	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.gruvbox_material_transparent_background = 2
	-- 		vim.cmd.colorscheme("gruvbox-material")
	-- 	end,
	-- },

	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
	},

	{
		"EdenEast/nightfox.nvim",
		lazy = true,
	},

	{
		"folke/tokyonight.nvim",
		lazy = true,
	},

	{
		"neanias/everforest-nvim",
		lazy = true,
	},

	{
		"rebelot/kanagawa.nvim",
		lazy = true,
	},
}
