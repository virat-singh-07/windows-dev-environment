return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",

	-- config = function()
	-- 	local treesitter = require("nvim-treesitter")
	--
	-- 	treesitter.setup()
	--
	-- 	treesitter.install({
	-- 		"lua",
	-- 		"vim",
	-- 		"vimdoc",
	-- 		"javascript",
	-- 		"typescript",
	-- 		"tsx",
	-- 		"html",
	-- 		"css",
	-- 		"json",
	-- 	})
	-- end,
}
