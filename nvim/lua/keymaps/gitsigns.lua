local M = {}

function M.attach(bufnr)
	local gs = package.loaded.gitsigns

	vim.keymap.set("n", "]h", function()
		gs.next_hunk()
	end, {
		buffer = bufnr,
		desc = "Gitsigns: jump to the next hunk when reviewing changed lines in the file",
	})

	vim.keymap.set("n", "[h", function()
		gs.prev_hunk()
	end, {
		buffer = bufnr,
		desc = "Gitsigns: jump to the previous hunk when reviewing changed lines in the file",
	})

	vim.keymap.set("n", "<leader>hp", function()
		gs.preview_hunk()
	end, {
		buffer = bufnr,
		desc = "Gitsigns: preview the current hunk when you want to inspect a diff before acting",
	})

	vim.keymap.set("n", "<leader>hs", function()
		gs.stage_hunk()
	end, {
		buffer = bufnr,
		desc = "Gitsigns: stage the current hunk when you want to add it to the index",
	})

	vim.keymap.set("n", "<leader>hr", function()
		gs.reset_hunk()
	end, {
		buffer = bufnr,
		desc = "Gitsigns: reset the current hunk when you want to discard local changes for it",
	})

	vim.keymap.set("n", "<leader>hu", function()
		gs.undo_stage_hunk()
	end, {
		buffer = bufnr,
		desc = "Gitsigns: undo staging for the current hunk when you want to remove it from the index",
	})

	vim.keymap.set("n", "<leader>hb", function()
		gs.blame_line({ full = true })
	end, {
		buffer = bufnr,
		desc = "Gitsigns: blame the current line when you want full commit context",
	})
end

return M
