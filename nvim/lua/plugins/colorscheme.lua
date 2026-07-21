local theme_state_file = vim.fn.stdpath("state") .. "/theme.txt"

local function read_saved_theme()
	local ok, lines = pcall(vim.fn.readfile, theme_state_file)
	if ok and lines and lines[1] and lines[1] ~= "" then
		return lines[1]
	end

	return "rose-pine"
end

local function save_theme(theme)
	vim.fn.writefile({ theme }, theme_state_file)
end

local function apply_diagnostic_highlights()
	vim.api.nvim_set_hl(0, "DiagnosticLineNrError", {
		fg = "#ea6962",
		bold = true,
	})

	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", {
		fg = "#ea6962",
		bold = true,
	})

	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", {
		fg = "#d8a657",
		bold = true,
	})
end

local function apply_transparency()
	local groups = {
		"Normal",
		"NormalNC",
		"SignColumn",
		"EndOfBuffer",
		"FoldColumn",
		"VertSplit",
		"StatusLine",
		"TabLine",
		"TabLineFill",
	}

	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, { bg = "NONE" })
	end
end

local function setup_rose_pine()
	require("rose-pine").setup({
		styles = { transparency = true },
	})
end

local function setup_catppuccin()
	require("catppuccin").setup({
		transparent_background = true,
	})
end

local function setup_gruvbox_material()
	vim.g.gruvbox_material_transparent_background = 2
end

local function setup_nightfox()
	require("nightfox").setup({
		options = { transparent = true },
	})
end

local function setup_tokyonight()
	require("tokyonight").setup({
		style = "night",
		transparent = true,
	})
end

local function setup_everforest()
	require("everforest").setup({
		transparent_background_level = 2,
	})
end

local function setup_kanagawa()
	require("kanagawa").setup({
		transparent = true,
	})
end

local themes = {
	["rose-pine"] = {
		setup = setup_rose_pine,
	},
	["catppuccin"] = {
		setup = setup_catppuccin,
	},
	["gruvbox-material"] = {
		setup = setup_gruvbox_material,
	},
	["nightfox"] = {
		setup = setup_nightfox,
	},
	["tokyonight"] = {
		setup = setup_tokyonight,
	},
	["everforest"] = {
		setup = setup_everforest,
	},
	["kanagawa"] = {
		setup = setup_kanagawa,
	},
}

local function apply_theme(theme)
	local entry = themes[theme] or themes["rose-pine"]
	entry.setup()
	vim.cmd.colorscheme(theme)
	apply_diagnostic_highlights()
	apply_transparency()
	save_theme(theme)
end

vim.g.config_apply_theme = apply_theme

local function startup_theme()
	return read_saved_theme()
end

vim.g.config_startup_theme = startup_theme

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			setup_rose_pine()
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			setup_gruvbox_material()
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			setup_catppuccin()
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			setup_nightfox()
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			setup_tokyonight()
		end,
	},
	{
		"neanias/everforest-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			setup_everforest()
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			setup_kanagawa()
		end,
	},
}
