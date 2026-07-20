local M = {}

function M.setup()
	vim.keymap.set("n", "<leader>cf", function()
		require("conform").format()
	end, {
		desc = "Format code when you want Conform to apply the buffer's formatter",
	})
end

return M
