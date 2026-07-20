local themes = {
	"rose-pine",
	"catppuccin",
	"gruvbox-material",
	"nightfox",
	"tokyonight",
	"everforest",
	"kanagawa",
}

local function set_theme(theme)
	if vim.g.config_apply_theme then
		vim.g.config_apply_theme(theme)
		return
	end

	vim.cmd.colorscheme(theme)
end

vim.keymap.set("n", "<leader>ct", function()
	vim.ui.select(themes, {
		title = "Select theme",
	}, function(choice)
		if choice then
			set_theme(choice)
		end
	end)
end, {
	desc = "Change theme when you want to switch the editor colorscheme interactively",
})
