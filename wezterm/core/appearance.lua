local wezterm = require("wezterm")
local selected_theme = require("state.theme")
local paths = require("core.paths")

local M = {}

function M.apply(config)
    -- Font
    config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
    config.font_size = 12.0

    -- Color scheme
    config.color_scheme = selected_theme

    -- Background wallpaper
    config.window_background_image = paths.wallpaper

    config.window_background_image_hsb = {
        brightness = 0.01,
        saturation = 0.75,
    }

    config.window_background_opacity = 0.78
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
