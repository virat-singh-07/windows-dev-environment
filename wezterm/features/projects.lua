local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local M = {}

local projects_root = [[C:\Work\Projects]]

local function get_projects()
  local choices = {}

  for _, entry in ipairs(wezterm.read_dir(projects_root)) do
    local name = entry:match([[([^\/\\]+)$]])

    if name then
      table.insert(choices, {
        id = entry,
        label = "󰉋  " .. name,
      })
    end
  end

  table.sort(choices, function(a, b)
    return a.label:lower() < b.label:lower()
  end)

  return choices
end

local function workspace_exists(workspace_name)
  for _, existing_name in ipairs(mux.get_workspace_names()) do
    if existing_name == workspace_name then
      return true
    end
  end

  return false
end

function M.open()
  return act.InputSelector({
    title = "Select Project",
    fuzzy = true,
    choices = get_projects(),

    action = wezterm.action_callback(function(window, pane, path)
      if not path then
        return
      end

      local workspace_name = path:match([[([^\/\\]+)$]])

      if workspace_exists(workspace_name) then
        window:perform_action(
          act.SwitchToWorkspace({
            name = workspace_name,
          }),
          pane
        )

        return
      end

      window:perform_action(
        act.SwitchToWorkspace({
          name = workspace_name,
          spawn = {
            cwd = path,
          },
        }),
        pane
      )
    end),
  })
end

return M
