local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.open()
  return act.ShowLauncherArgs({
    flags = "FUZZY|LAUNCH_MENU_ITEMS|DOMAINS|TABS|WORKSPACES",
  })
end

return M
