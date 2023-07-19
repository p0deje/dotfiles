---@type ChadrcConfig
local M = {}
M.ui = {
  extended_integrations = { "notify" },
  lsp_semantic_tokens = true,
  theme = "gruvbox_light",
  theme_toggle = { "gruvbox", "gruvbox_light" },
  statusline = {
    theme = "default",
    separator_style = "round",
  },
  tabufline = {
    lazyload = false,
  },
  nvdash = {
    load_on_startup = true,

    header = {
      " ███╗   ██╗ ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝   ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    },

    buttons = {
      {
        "󰈚  Sessions",
        "Enter",
        function()
          require("telescope").load_extension("possession")
          require("telescope").extensions.possession.list()
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
