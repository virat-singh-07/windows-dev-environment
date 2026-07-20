local M = {}

function M.apply_saved_theme()
	if vim.g.config_apply_theme and vim.g.config_startup_theme then
		vim.g.config_apply_theme(vim.g.config_startup_theme())
	end
end

return M
