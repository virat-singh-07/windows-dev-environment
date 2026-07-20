local M = {}

function M.setup()
	vim.keymap.set("n", "<leader>gg", function()
		require("neogit").open()
	end, {
		desc = "Open Neogit when you want an interactive git UI",
	})
end

return M
