local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.create(window, pane, workspace_name, project_path)
  -- Create the workspace and first tab
  window:perform_action(
    act.SwitchToWorkspace({
      name = workspace_name,
      spawn = {
        cwd = project_path,
      },
    }),
    pane
  )

  -- API
  window:perform_action(
    act.SpawnCommandInNewTab({
      cwd = project_path,
    }),
    pane
  )

  -- Notes
  window:perform_action(
    act.SpawnCommandInNewTab({
      cwd = project_path,
    }),
    pane
  )

  -- AI
  window:perform_action(
    act.SpawnCommandInNewTab({
      cwd = project_path,
    }),
    pane
  )

  -- Explorer
  window:perform_action(
    act.SpawnCommandInNewTab({
      cwd = project_path,
      args = {
        "yazi",
      },
    }),
    pane
  )
end

return M
