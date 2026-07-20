local function jump_with_float(count)
	vim.diagnostic.jump({
		count = count,
		on_jump = function()
			vim.diagnostic.open_float()
		end,
	})
end

local severity = vim.diagnostic.severity

local function errors_only()
	vim.diagnostic.config({
		virtual_text = {
			severity = {
				min = severity.ERROR,
				max = severity.ERROR,
			},
		},
	})
end

local function all_diagnostics()
	vim.diagnostic.config({
		virtual_text = true,
	})
end

local function no_virtual_text()
	vim.diagnostic.config({
		virtual_text = false,
	})
end

vim.diagnostic.config({
	signs = true,
	underline = true,
	update_in_insert = false,
})

vim.keymap.set("n", "<leader>de", errors_only, {
	desc = "Diagnostics: errors only",
})

vim.keymap.set("n", "<leader>da", all_diagnostics, {
	desc = "Diagnostics: show all",
})

vim.keymap.set("n", "<leader>dn", no_virtual_text, {
	desc = "Diagnostics: hide virtual text",
})


vim.keymap.set("n", "[d", function()
	jump_with_float(-1)
end, {
	desc = "Previous diagnostic",
})

vim.keymap.set("n", "]d", function()
	jump_with_float(1)
end, {
	desc = "Next diagnostic",
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
	desc = "Show diagnostic",
})

errors_only()
