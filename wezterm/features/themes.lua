local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local theme_state_file =
[[C:\Work\Config\wezterm\state\theme.lua]]

local themes = {
    "Catppuccin Latte",
    "Catppuccin Frappé",
    "Catppuccin Macchiato",
    "Catppuccin Mocha",

    "Tokyo Night",
    "Tokyo Night Storm",
    "Tokyo Night Moon",
    "Tokyo Night Day",

    "Kanagawa",
    "Kanagawa (Dragon)",
    "Kanagawa (Lotus)",
    "Kanagawa (Wave)",

    "Gruvbox Dark",
    "Gruvbox Dark (Gogh)",
    "Gruvbox Material (Gogh)",
    "Gruvbox Light",

    "OneDark (base16)",
    "OneHalfDark",
    "OneHalfLight",

    "Dracula",
    "Dracula+",

    "Nord",
    "Nord (Gogh)",

    "Everforest Dark (Gogh)",
    "Everforest Light (Gogh)",

    "Rosé Pine",
    "Rosé Pine Moon",
    "Rosé Pine Dawn",

    "Solarized Dark",
    "Solarized Light",

    "GitHub Dark",
    "GitHub Light",

    "Dark+",
    "Light+",

    "Ayu Dark (Gogh)",
    "Ayu Mirage",
    "Batman",
    "Monokai Pro",
    "Monokai Soda",
    "Material",
    "Material Darker",
    "Material Ocean",
    "Material Palenight",
    "Night Owl (Gogh)",
    "OceanicNext",
    "Palenight (Gogh)",

    "Builtin Dark",
    "Builtin Solarized Dark",
}

local function save_theme(theme)
    local file, error_message = io.open(theme_state_file, "w")

    if not file then
        wezterm.log_error(
            "Unable to save theme: " .. tostring(error_message)
        )

        return false
    end

    file:write(
        string.format("return %q\n", theme)
    )

    file:close()

    return true
end

function M.open()
    local choices = {}

    for _, theme in ipairs(themes) do
        table.insert(choices, {
            id = theme,
            label = theme,
        })
    end

    return act.InputSelector({
        title = "Select WezTerm Theme",
        fuzzy = true,
        choices = choices,

        action = wezterm.action_callback(function(window, pane, theme)
            if not theme then
                return
            end

            if save_theme(theme) then
                wezterm.reload_configuration()
            end
        end),
    })
end

return M
