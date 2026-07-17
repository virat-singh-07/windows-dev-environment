local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply(config)
  config.mouse_bindings = {
    {
      event = {
        Up = {
          streak = 1,
          button = "Left",
        },
      },
      mods = "NONE",
      action = act.CompleteSelection("ClipboardAndPrimarySelection"),
    },

    {
      event = {
        Down = {
          streak = 1,
          button = "Right",
        },
      },
      mods = "NONE",
      action = act.PasteFrom("Clipboard"),
    },

    {
      event = {
        Drag = {
          streak = 1,
          button = "Left",
        },
      },
      mods = "ALT",
      action = act.StartWindowDrag,
    },
  }
end

return M
