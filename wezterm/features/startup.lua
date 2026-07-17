local wezterm = require("wezterm")

local M = {}

function M.apply()
  wezterm.on("gui-startup", function()
    -- Startup automation will be added here later.
  end)
end

return M
