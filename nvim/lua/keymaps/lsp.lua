vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
	desc = "Go to definition when you need to jump to a symbol's implementation source",
})

vim.keymap.set("n", "gr", vim.lsp.buf.references, {
	desc = "Show references when you want to find all usages of the current symbol",
})

vim.keymap.set("n", "K", vim.lsp.buf.hover, {
	desc = "Show hover information when you want inline docs or type details for the symbol under cursor",
})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
	desc = "Go to declaration when you want the symbol's declared interface or signature",
})

vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
	desc = "Go to implementation when you want the concrete implementation behind an interface",
})

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
	desc = "Rename symbol when you want to safely update all symbol references",
})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
	desc = "Open code actions when you want fixes, refactors, or quick assists from the language server",
})
