return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			vim.keymap.set("n", "]h", function()
				gs.next_hunk()
			end, {
				buffer = bufnr,
			})
			vim.keymap.set("n", "[h", function()
				gs.prev_hunk()
			end, {
				buffer = bufnr,
			})
			vim.keymap.set("n", "<leader>hp", function()
				gs.preview_hunk()
			end, {
				buffer = bufnr,
			})
			vim.keymap.set("n", "<leader>hs", function()
				gs.stage_hunk()
			end, {
				buffer = bufnr,
			})
			vim.keymap.set("n", "<leader>hu", function()
				gs.undo_stage_hunk()
			end, {
				buffer = bufnr,
			})
		end,
	},
}
-- This is the check for the same for the git sign
