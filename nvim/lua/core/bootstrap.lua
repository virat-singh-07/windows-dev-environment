local data_path = vim.fn.stdpath("data")
local lazy_path = vim.fs.joinpath(data_path, "lazy", "lazy.nvim")
local lazy_exists = vim.uv.fs_stat(lazy_path) ~= nil
local plugins = require("plugins")
if not lazy_exists then
	local clone_result = vim.system({
		"git",
		"clone",
		"https://github.com/folke/lazy.nvim.git",
		lazy_path,
	}):wait()

	if clone_result.code ~= 0 then
		vim.notify("Failed to clone lazy.nvim\n" .. clone_result.stderr, vim.log.levels.ERROR)
		return
	end
end
vim.opt.rtp:prepend(lazy_path)
local lazy = require("lazy")
lazy.setup({
	spec = plugins,
})
