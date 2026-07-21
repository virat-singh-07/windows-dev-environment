local M = {}

function M.setup()
	vim.keymap.set("n", "<leader>gg", ":vertical Git<CR>", {
		desc = "Open Fugitive git status",
	})
end

return M
