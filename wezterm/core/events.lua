local wezterm = require("wezterm")

local M = {}

local function get_mode(window)
  local active_key_table = window:active_key_table()

  if active_key_table == "resize_pane" then
    return "RESIZE"
  end

  if active_key_table then
    return string.upper(active_key_table)
  end

  if window:leader_is_active() then
    return "LEADER"
  end

  return "NORMAL"
end

local function get_pane_label(pane)
  local current_tab = pane:tab()
  local pane_count = 1
  local is_zoomed = false

  if current_tab then
    local panes = current_tab:panes_with_info()
    pane_count = #panes

    for _, pane_info in ipairs(panes) do
      if pane_info.is_active and pane_info.is_zoomed then
        is_zoomed = true
        break
      end
    end
  end

  if is_zoomed then
    return "ZOOM", pane_count
  end

  if pane_count == 1 then
    return "1 Pane", pane_count
  end

  return tostring(pane_count) .. " Panes", pane_count
end

local function get_tab_label(window)
  local active_tab_index = 1
  local tab_count = 1
  local active_tab_title = "Untitled"

  local tabs = window:mux_window():tabs_with_info()

  if tabs and #tabs > 0 then
    tab_count = #tabs

    for index, tab_info in ipairs(tabs) do
      if tab_info.is_active then
        active_tab_index = index
        break
      end
    end
  end

  local current_tab = window:active_tab()
  if current_tab then
    local title = current_tab:get_title()
    if title and title ~= "" then
      active_tab_title = title
    end
  end

  return active_tab_title .. "  " .. tostring(active_tab_index) .. "/" .. tostring(tab_count)
end

function M.apply()
  wezterm.on("update-right-status", function(window, pane)
    local workspace = window:active_workspace()
    local mode = get_mode(window)
    local pane_label = get_pane_label(pane)
    local tab_label = get_tab_label(window)

    window:set_left_status(
      wezterm.format({
        { Background = { Color = "#89b4fa" } },
        { Foreground = { Color = "#1e1e2e" } },
        { Attribute = { Intensity = "Bold" } },
        { Text = "   " .. workspace .. "  " },
      })
    )

    window:set_right_status(
      wezterm.format({
        { Background = { Color = "#45475a" } },
        { Foreground = { Color = "#cdd6f4" } },
        { Attribute = { Intensity = "Bold" } },
        { Text = "  " .. tab_label .. "  " },
        { Background = { Color = "#313244" } },
        { Foreground = { Color = "#cdd6f4" } },
        { Text = "  " .. mode .. "  " },
        { Background = { Color = "#a6e3a1" } },
        { Foreground = { Color = "#1e1e2e" } },
        { Text = "  " .. pane_label .. "  " },
      })
    )
  end)
end

return M
