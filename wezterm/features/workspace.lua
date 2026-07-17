local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local M = {}

local wezterm_exe = [[C:\Work\Tools\Wezterm\wezterm.exe]]

function M.switcher()
    return act.ShowLauncherArgs({
        flags = "FUZZY|WORKSPACES",
    })
end

function M.create()
    return act.PromptInputLine({
        description = "Name for new workspace:",

        action = wezterm.action_callback(function(window, pane, line)
            if line and line ~= "" then
                window:perform_action(
                    act.SwitchToWorkspace({
                        name = line,
                    }),
                    pane
                )
            end
        end),
    })
end

function M.close_current()
    return act.PromptInputLine({
        description = "Type CLOSE to close the current workspace:",

        action = wezterm.action_callback(function(window, pane, line)
            if line ~= "CLOSE" then
                return
            end

            local workspace_name = window:active_workspace()

            -- Never destroy the default workspace.
            if workspace_name == "default" then
                window:toast_notification(
                    "WezTerm",
                    "The default workspace cannot be closed.",
                    nil,
                    3000
                )

                return
            end

            local mux_window = window:mux_window()
            local pane_ids = {}

            -- Collect pane IDs before switching away.
            for _, tab in ipairs(mux_window:tabs()) do
                for _, workspace_pane in ipairs(tab:panes()) do
                    table.insert(pane_ids, workspace_pane:pane_id())
                end
            end

            -- Move safely to default before killing the old workspace panes.
            window:perform_action(
                act.SwitchToWorkspace({
                    name = "default",
                    spawn = {
                        cwd = [[C:\Work]],
                    },
                }),
                pane
            )

            -- A workspace disappears when all of its panes are terminated.
            for _, pane_id in ipairs(pane_ids) do
                wezterm.run_child_process({
                    wezterm_exe,
                    "cli",
                    "kill-pane",
                    "--pane-id",
                    tostring(pane_id),
                })
            end
        end),
    })
end

return M
