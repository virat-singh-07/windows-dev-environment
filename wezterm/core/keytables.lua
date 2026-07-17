local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply(config)
  config.key_tables = {
    resize_pane = {
      {
        key = "h",
        action = act.AdjustPaneSize({
          "Left",
          3,
        }),
      },
      {
        key = "l",
        action = act.AdjustPaneSize({
          "Right",
          3,
        }),
      },
      {
        key = "k",
        action = act.AdjustPaneSize({
          "Up",
          3,
        }),
      },
      {
        key = "j",
        action = act.AdjustPaneSize({
          "Down",
          3,
        }),
      },
      {
        key = "Escape",
        action = "PopKeyTable",
      },
      {
        key = "Enter",
        action = "PopKeyTable",
      },
    },
  }
end

return M
