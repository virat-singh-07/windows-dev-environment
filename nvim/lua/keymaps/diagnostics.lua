local function telescope_builtin()
	return require("telescope.builtin")
end

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
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticLineNrError",
		},
	},
	underline = true,
	update_in_insert = false,
})

vim.keymap.set("n", "<leader>dd", function()
	telescope_builtin().diagnostics()
end, {
	desc = "All diagnostics",
})

vim.keymap.set("n", "<leader>db", function()
	telescope_builtin().diagnostics({
		bufnr = 0,
	})
end, {
	desc = "Buffer diagnostics",
})

vim.keymap.set("n", "<leader>dq", function()
	telescope_builtin().quickfix()
end, {
	desc = "Quickfix list",
})

vim.keymap.set("n", "<leader>dl", function()
	telescope_builtin().loclist()
end, {
	desc = "Location list",
})

vim.keymap.set("n", "<leader>de", function()
	telescope_builtin().diagnostics({
		severity = vim.diagnostic.severity.ERROR,
	})
end, {
	desc = "Errors",
})

vim.keymap.set("n", "<leader>dw", function()
	telescope_builtin().diagnostics({
		severity = vim.diagnostic.severity.WARN,
	})
end, {
	desc = "Warnings",
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
