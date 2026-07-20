local M = {}

function M.setup()
	vim.keymap.set("n", "<leader>ff", function()
		require("telescope.builtin").find_files()
	end, {
		desc = "Find files when you want to search and open project files",
	})

	vim.keymap.set("n", "<leader>fg", function()
		require("telescope.builtin").live_grep()
	end, {
		desc = "Find text when you want to grep through project contents",
	})

	vim.keymap.set("n", "<leader>fb", function()
		require("telescope.builtin").buffers()
	end, {
		desc = "Find buffers when you want to switch between open files",
	})
end

return M
