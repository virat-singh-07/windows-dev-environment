vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
	desc = "Go to definition",
})

vim.keymap.set("n", "gr", vim.lsp.buf.references, {
	desc = "Show references",
})

vim.keymap.set("n", "K", vim.lsp.buf.hover, {
	desc = "Show hover information",
})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
	desc = "Go to declaration",
})

vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
	desc = "Go to implementation",
})

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
	desc = "Rename symbol",
})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
	desc = "Code action",
})
