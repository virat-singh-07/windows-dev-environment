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
	desc = "Diagnostics: show only errors in virtual text when you want to focus on critical issues",
})

vim.keymap.set("n", "<leader>da", all_diagnostics, {
	desc = "Diagnostics: show all diagnostic severities in virtual text when you need full context",
})

vim.keymap.set("n", "<leader>dn", no_virtual_text, {
	desc = "Diagnostics: hide virtual text when you want a cleaner buffer view",
})


vim.keymap.set("n", "[d", function()
	jump_with_float(-1)
end, {
	desc = "Jump to the previous diagnostic and open its float when reviewing issues upward in the file",
})

vim.keymap.set("n", "]d", function()
	jump_with_float(1)
end, {
	desc = "Jump to the next diagnostic and open its float when reviewing issues downward in the file",
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
	desc = "Open the diagnostic float under the cursor when you want details for the current issue",
})

errors_only()
