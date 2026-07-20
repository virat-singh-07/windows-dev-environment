local wezterm = require("wezterm")

local config = wezterm.config_builder()

package.path = table.concat({
  wezterm.config_dir .. [[\?.lua]],
  wezterm.config_dir .. [[\?\init.lua]],
  package.path,
}, ";")

local options = require("core.options")
local appearance = require("core.appearance")
local keys = require("core.keys")
local mouse = require("core.mouse")
local keytables = require("core.keytables")
local events = require("core.events")
local statusbar = require("features.statusbar")

options.apply(config)
appearance.apply(config)
keys.apply(config)
mouse.apply(config)
keytables.apply(config)
statusbar.apply(config)
events.apply()

return config
