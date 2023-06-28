---@type ChadrcConfig
local M = {}
M.ui = {
  theme = "gruvbox_light",
  theme_toggle = { "gruvbox", "gruvbox_light" },
  statusline = {
    separator_style = "block",
  },
  tabufline = {
    lazyload = false,
  },
  nvdash = {
    load_on_startup = true,

    header = {
      " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    },

    buttons = {
      {
        "󰈚  Sessions",
        "Spc f s",
        function()
          require("auto-session.session-lens").search_session()
        end,
      },
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
    },
  },
  telescope = {
    style = "bordered",
  },
}
M.mappings = require("custom.mappings")
M.plugins = "custom.plugins"
return M
