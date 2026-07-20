-- Here add syntax highlighting etc

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = {
-- 		"javascript",
-- 		"javascriptreact",
-- 		"typescript",
-- 		"typescriptreact",
-- 		"lua",
-- 		"json",
-- 		"html",
-- 		"css",
-- 	},
-- 	callback = function()
-- 		vim.treesitter.start()
-- 	end,
-- })
