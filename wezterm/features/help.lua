local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local shortcuts = {
    {
        category = "Workspace",
        key = "Leader + s",
        description = "Switch workspace",
    },
    {
        category = "Workspace",
        key = "Leader + w",
        description = "Create workspace",
    },
    {
        category = "Workspace",
        key = "Leader + Shift+w",
        description = "Close current workspace",
    },
    {
        category = "Workspace",
        key = "Leader + Shift+p",
        description = "Open project workspace",
    },

    {
        category = "Tabs",
        key = "Leader + c",
        description = "Create named tab",
    },
    {
        category = "Tabs",
        key = "Leader + t",
        description = "Search and switch tabs",
    },
    {
        category = "Tabs",
        key = "Leader + n",
        description = "Next tab",
    },
    {
        category = "Tabs",
        key = "Leader + p",
        description = "Previous tab",
    },
    {
        category = "Tabs",
        key = "Leader + Shift+x",
        description = "Close current tab",
    },

    {
        category = "Panes",
        key = "Leader + \\",
        description = "Split pane horizontally",
    },
    {
        category = "Panes",
        key = "Leader + -",
        description = "Split pane vertically",
    },
    {
        category = "Panes",
        key = "Leader + h",
        description = "Move to left pane",
    },
    {
        category = "Panes",
        key = "Leader + j",
        description = "Move to pane below",
    },
    {
        category = "Panes",
        key = "Leader + k",
        description = "Move to pane above",
    },
    {
        category = "Panes",
        key = "Leader + l",
        description = "Move to right pane",
    },
    {
        category = "Panes",
        key = "Leader + r",
        description = "Enter pane resize mode",
    },
    {
        category = "Panes",
        key = "Leader + z",
        description = "Zoom current pane",
    },
    {
        category = "Panes",
        key = "Leader + x",
        description = "Close current pane",
    },

    {
        category = "Window",
        key = "Leader + q",
        description = "Hide WezTerm window",
    },
    {
        category = "Window",
        key = "Leader + d",
        description = "Detach from local mux",
    },

    {
        category = "Launcher",
        key = "Leader + Shift+l",
        description = "Open full WezTerm launcher",
    },

    {
        category = "Clipboard",
        key = "Ctrl + v",
        description = "Paste from clipboard",
    },
    {
        category = "Clipboard",
        key = "Ctrl + Shift+c",
        description = "Copy selected text",
    },
}

function M.open()
    local choices = {}

    for index, shortcut in ipairs(shortcuts) do
        table.insert(choices, {
            id = tostring(index),
            label = string.format(
                "%-11s  %-20s  %s",
                shortcut.category,
                shortcut.key,
                shortcut.description
            ),
        })
    end

    return act.InputSelector({
        title = "WezTerm Keymap Help",
        fuzzy = true,
        choices = choices,

        action = wezterm.action_callback(function()
            -- Informational menu only.
        end),
    })
end

return M
