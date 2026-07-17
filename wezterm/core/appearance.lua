local wezterm = require("wezterm")
local selected_theme = require("state.theme")

local M = {}

function M.apply(config)
    -- Font
    config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
    config.font_size = 12.0

    -- Color scheme
    config.color_scheme = selected_theme

    -- Background wallpaper
    config.window_background_image =
    [[C:\Work\Assets\Wallpapers\wallpaper-01.jpg]]

    config.window_background_image_hsb = {
        brightness = 0.20,
        saturation = 0.90,
    }

    config.window_background_opacity = 0.80
    config.text_background_opacity = 1.0

    -- Window appearance
    config.window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10,
    }

    config.window_decorations = "NONE"
end

return M
