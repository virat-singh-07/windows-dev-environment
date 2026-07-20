local wezterm = require("wezterm")
package.path = table.concat({
  "C:/Work/Config/wezterm/?.lua",
  "C:/Work/Config/wezterm/?/init.lua",
  package.path,
}, ";")

require("core.options")
require("core.appearance")
require("features.projects")
require("features.workspace")
print("ok")
