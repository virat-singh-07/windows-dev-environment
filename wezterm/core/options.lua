local paths = require("core.paths")

local M = {}

function M.apply(config)
  -- Persistent local mux domain
  config.unix_domains = {
    {
      name = "local-mux",
    },
  }

  config.default_gui_startup_args = {
    "connect",
    "local-mux",
  }

  -- Default shell
  config.default_prog = {
    paths.nu_exe,
  }

  -- Default working directory
  config.default_cwd = paths.work_root

  -- General behavior
  config.initial_cols = 130
  config.initial_rows = 35
  config.scrollback_lines = 10000
  config.window_close_confirmation = "NeverPrompt"
  config.automatically_reload_config = true
end

return M