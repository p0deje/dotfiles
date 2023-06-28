local plugins = {
  {
    "mcauley-penney/tidy.nvim",
    event = "BufWritePre",
    config = true,
  },

  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      log_level = "error",
      session_lens = {
        load_on_setup = true,
        theme_conf = {
          border = true,
        },
        previewer = false,
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<ESC>"] = function(...)
              require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
    keys = {
      { "<D-S-p>", "<CMD>Telescope commands<CR>", desc = "Command palette" },
      { "<D-p>", "<CMD>Telescope find_files<CR>", desc = "Go to file" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require("custom.configs.null-ls")
      end,
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      tab = {
        sync = {
          open = true,
          close = true,
        },
      },
    },
    configs = function()
      require("plugins.configs.nvimtree")
      require("custom.configs.nvimtree")
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "buildifier",
        "lua-language-server",
        "solargraph",
        "standardrb",
        "starlark_rust",
        "stylua",
      },
    },
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = true,
  },

  {
    "tpope/vim-fugitive",
    cmd = { "G" },
    keys = {
      {
        "<Leader>g",
        function()
          if vim.bo[vim.api.nvim_win_get_buf(0)].ft == "fugitive" then
            vim.cmd("q")
          else
            vim.cmd([[
              NvimTreeToggle
              G
              15wincmd_
              NvimTreeToggle
              G
            ]])
          end
        end,
        desc = "Fugitive",
        nowait = true,
      },
    },
  },

  {
    "tpope/vim-rhubarb",
    cmd = { "GBrowse" },
    dependencies = "tpope/vim-fugitive",
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
  },

  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    keys = {
      { "<D-S-m>", "<CMD>TroubleToggle<CR>", desc = "Trouble" },
    },
  },

  {
    "bennypowers/splitjoin.nvim",
    keys = {
      {
        "gJ",
        function()
          require("splitjoin").join()
        end,
        desc = "Join the object under cursor",
      },
      {
        "gS",
        function()
          require("splitjoin").split()
        end,
        desc = "Split the object under cursor",
      },
    },
  },

  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    config = true,
  },

  {
    "ethanholz/nvim-lastplace",
    opts = {
      lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
      lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
      lastplace_open_folds = true,
    },
  },

  {
    "tzachar/highlight-undo.nvim",
    config = true,
  },

  {
    "tpope/vim-abolish",
    event = "VeryLazy",
  },

  {
    "gbprod/substitute.nvim",
    keys = {
      {
        "cx",
        function()
          require("substitute.exchange").operator()
        end,
        desc = "Exchange text object",
      },
      {
        "cxx",
        function()
          require("substitute.exchange").line()
        end,
        desc = "Exchange line",
      },
      {
        "X",
        function()
          require("substitute.exchange").visual()
        end,
        mode = { "x" },
        desc = "Exchange selection",
      },
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = {
          keys = { "f", "F", "t", "T" },
        },
      },
    },
  },

  -- {
  --   "kevinhwang91/nvim-hlslens",
  --   event = "VeryLazy",
  --   config = function()
  --     require("scrollbar.handlers.search").setup()
  --   end,
  --   keys = {
  --     {
  --       "n",
  --       [[
  --         <CMD>execute('normal! ' . v:count1 . 'n')<CR>
  --         <CMD>lua require('hlslens').start()<CR>
  --       ]],
  --       desc = "Next search",
  --     },
  --     {
  --       "N",
  --       [[
  --         <CMD>execute('normal! ' . v:count1 . 'N')<CR>
  --         <CMD>lua require('hlslens').start()<CR>
  --       ]],
  --       desc = "Previous search",
  --     },
  --     {
  --       "*",
  --       "*<CMD>lua require('hlslens').start()<CR>",
  --       desc = "Search next current word ",
  --     },
  --     {
  --       "#",
  --       "#<CMD>lua require('hlslens').start()<CR>",
  --       desc = "Search previous current word",
  --     },
  --     {
  --       "g*",
  --       "g*<CMD>lua require('hlslens').start()<CR>",
  --       desc = "Search next current word partially ",
  --     },
  --     {
  --       "g#",
  --       "g#<CMD>lua require('hlslens').start()<CR>",
  --       desc = "Search previous current word partially",
  --     },
  --   },
  -- },

  {
    "lewis6991/gitsigns.nvim",
    configs = function()
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },

  {
    "mhinz/vim-grepper",
    cmd = { "Grepper", "GrepperRg" },
    keys = {
      { "ga", "<Plug>(GrepperOperator)", desc = "Grep text object/selection", mode = { "n", "x" } },
      { "ga<SPACE>", ":GrepperRg<SPACE>", desc = "Start grep prompt" },
      { "gac", "<CMD>execute 'GrepperRg ' . shellescape(@+)<CR>", desc = "Grep copy", silent = true },
    },
  },

  {
    "stefandtw/quickfix-reflector.vim",
    ft = "qf",
  },

  {
    "booperlv/nvim-gomove",
    opts = {
      map_defaults = false,
    },
    keys = {
      { "[e", "<Plug>GoNSMUp", desc = "Move line up" },
      { "[e", "<Plug>GoVSMUp", desc = "Move line up", mode = { "v" } },
      { "]e", "<Plug>GoNSMDown", desc = "Move line down" },
      { "]e", "<Plug>GoVSMDown", desc = "Move line down", mode = { "v" } },
    },
  },

  {
    "tummetott/unimpaired.nvim",
    event = "VeryLazy",
    opts = {
      keymaps = {
        exchange_above = false,
        exchange_below = false,
        exchange_section_above = false,
        exchange_section_below = false,
      },
    },
  },

  {
    "gelguy/wilder.nvim",
    event = "VeryLazy",
    opts = {
      modes = { ":", "/", "?" },
    },
  },
}

return plugins
