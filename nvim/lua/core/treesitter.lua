-- Built-in Tree-sitter in Neovim 0.12
-- Keep this separate from nvim-treesitter plugin setup.

local filetypes = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"lua",
	"json",
	"html",
	"css",
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
