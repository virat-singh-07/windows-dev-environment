return {
	"lewis6991/gitsigns.nvim",
	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 800,
			ignore_whitespace = false,
		},
		on_attach = function(bufnr)
			require("keymaps.gitsigns").attach(bufnr)
		end,
	},
}
-- This is the check for the same for the git sign
