return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ok, configs = pcall(require, "nvim-treesitter.config")
		if not ok then
			vim.notify("nvim-treesitter not available", vim.log.levels.WARN)
			return
		end

		configs.setup({
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"json",
			},
		})
	end,
}
