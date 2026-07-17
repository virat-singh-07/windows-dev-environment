local launcher = require("features.launcher")
local projects = require("features.projects")
local workspace = require("features.workspace")
local themes = require("features.themes")
local wezterm = require("wezterm")
local help = require("features.help")
local act = wezterm.action


local M = {}

function M.apply(config)
    config.leader = {
        key = "a",
        mods = "CTRL",
        timeout_milliseconds = 1000,
    }

    config.keys = {
        {
            key = "q",
            mods = "LEADER",
            action = act.Hide,
        },
        {
            key = "x",
            mods = "LEADER|SHIFT",
            action = act.CloseCurrentTab({
                confirm = true,
            }),
        },

        {
            key = "d",
            mods = "LEADER",
            action = act.DetachDomain({
                DomainName = "local-mux",
            }),
        },

        {
            key = "v",
            mods = "CTRL",
            action = act.PasteFrom("Clipboard"),
        },

        {
            key = "c",
            mods = "CTRL|SHIFT",
            action = act.CopyTo("Clipboard"),
        },

        {
            key = "-",
            mods = "LEADER",
            action = act.SplitVertical({
                domain = "CurrentPaneDomain",
            }),
        },

        {
            key = "\\",
            mods = "LEADER",
            action = act.SplitHorizontal({
                domain = "CurrentPaneDomain",
            }),
        },

        {
            key = "h",
            mods = "LEADER",
            action = act.ActivatePaneDirection("Left"),
        },

        {
            key = "l",
            mods = "LEADER",
            action = act.ActivatePaneDirection("Right"),
        },
        {
            key = "t",
            mods = "LEADER|SHIFT",
            action = themes.open(),
        },

        {
            key = "t",
            mods = "LEADER",
            action = act.ShowLauncherArgs({
                flags = "FUZZY|TABS",
            }),
        },
        {
            key = "k",
            mods = "LEADER",
            action = act.ActivatePaneDirection("Up"),
        },

        {
            key = "j",
            mods = "LEADER",
            action = act.ActivatePaneDirection("Down"),
        },

        {
            key = "x",
            mods = "LEADER",
            action = act.CloseCurrentPane({
                confirm = true,
            }),
        },

        {
            key = "r",
            mods = "LEADER",
            action = act.ActivateKeyTable({
                name = "resize_pane",
                one_shot = false,
                timeout_milliseconds = 3000,
            }),
        },

        {
            key = "c",
            mods = "LEADER",
            action = act.PromptInputLine({
                description = "Enter tab name:",

                action = wezterm.action_callback(function(window, pane, line)
                    if not line or line == "" then
                        return
                    end

                    window:perform_action(
                        act.SpawnTab("CurrentPaneDomain"),
                        pane
                    )

                    local active_tab = window:active_tab()

                    if active_tab then
                        active_tab:set_title(line)
                    end
                end),
            }),
        },

        {
            key = "n",
            mods = "LEADER",
            action = act.ActivateTabRelative(1),
        },

        {
            key = "p",
            mods = "LEADER",
            action = act.ActivateTabRelative(-1),
        },

        {
            key = "z",
            mods = "LEADER",
            action = act.TogglePaneZoomState,
        },

        {
            key = "s",
            mods = "LEADER",
            action = workspace.switcher(),
        },

        {
            key = "w",
            mods = "LEADER",
            action = workspace.create(),
        },

        {
            key = "l",
            mods = "LEADER|SHIFT",
            action = launcher.open(),
        },

        {
            key = "p",
            mods = "LEADER|SHIFT",
            action = projects.open(),
        },
        {
            key = "?",
            mods = "LEADER|SHIFT",
            action = help.open(),
        },
    }
end

return M
