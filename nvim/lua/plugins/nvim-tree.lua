return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		sync_root_with_cwd = true,

		update_focused_file = {
			enable = true,
			update_root = false,
		},

		view = {
			width = 35,
		},
	},
	keys = {
		{
			"<leader>ee",
			function()
				require("nvim-tree.api").tree.toggle()
			end,
			desc = "Toggle project explorer",
		},
		{
			"<leader>ef",
			function()
				require("nvim-tree.api").tree.find_file({
					open = true,
					focus = true,
				})
			end,
			desc = "Explorer current file",
		},
		{
			"<leader>ed",
			function()
				local file_directory = vim.fn.expand("%:p:h")
				require("nvim-tree.api").tree.open({
					path = file_directory,
					focus = true,
				})
			end,
			desc = "Explorer file directory",
		},
	},
}
