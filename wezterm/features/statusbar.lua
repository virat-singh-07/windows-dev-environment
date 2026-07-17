local M = {}

function M.apply(config)
  config.enable_tab_bar = true
  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = true

  config.hide_tab_bar_if_only_one_tab = false
  config.show_tabs_in_tab_bar = false
  config.show_new_tab_button_in_tab_bar = false

  config.status_update_interval = 250

  config.colors = {
    tab_bar = {
      background = "rgba(0,0,0,0)",
    },
  }
end

return M
