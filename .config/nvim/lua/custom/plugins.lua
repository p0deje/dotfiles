local plugins = {
  -- Remove trailing whitespaces.
  {
    "mcauley-penney/tidy.nvim",
    event = "BufWritePre",
    opts = {},
  },

  -- Autosave buffers.
  {
    "tmillr/sos.nvim",
    event = { "BufLeave", "FocusLost" },
    opts = {},
  },

  -- Session management.
  {
    "jedrzejboczar/possession.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      autosave = {
        current = true,
        on_quit = true,
      },
    },
  },

  -- Undo tree in Telescope.
  {
    "debugloop/telescope-undo.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("undo")
    end,
  },

  -- Fuzzy finder and picker.
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<ESC>"] = function(...)
              require("telescope.actions").close(...)
            end,
            ["<C-p>"] = function(...)
              require("telescope.actions").cycle_history_prev(...)
            end,
          },
        },
      },
    },
    keys = {
      { "<S-D-p>", "<CMD>Telescope commands<CR>", desc = "Command palette" },
      { "<D-p>", "<CMD>Telescope find_files<CR>", desc = "Go to file" },
    },
  },

  -- Language Server Protocol.
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

  -- File explorer.
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },
      sync_root_with_cwd = true,
      tab = {
        sync = {
          open = true,
          close = true,
        },
      },
      view = {
        centralize_selection = true,
        preserve_window_proportions = true,
        signcolumn = "no",
      },
      renderer = {
        full_name = true,
        highlight_git = true,
        icons = {
          symlink_arrow = " -> ",
        },
      },
    },
    configs = function()
      require("plugins.configs.nvimtree")
      require("custom.configs.nvimtree")
    end,
  },

  -- LSP package manager.
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "buildifier",
        "graphql-language-service-cli",
        "lua-language-server",
        "solargraph",
        "standardrb",
        "starlark_rust",
        "stylua",
        "typescript-language-server",
      },
    },
  },

  -- Surround operator.
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  -- Git plugins.
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gread", "GBrowse" },
    dependencies = { "tpope/vim-rhubarb" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "fugitive" },
        callback = function()
          vim.bo.buflisted = false
          vim.keymap.set("n", "q", "<CMD>q<CR>", { desc = "Quit", buffer = true, silent = true })
          vim.keymap.set("n", "gp", "<CMD>Git push<CR>", { desc = "Push", buffer = true })
          vim.keymap.set(
            "n",
            "gP",
            "<CMD>Git push --force-with-lease<CR>",
            { desc = "Push (force-with-lease)", buffer = true }
          )
        end,
      })
    end,
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
        desc = "Git",
        nowait = true,
      },
    },
  },

  -- Detect tabstop and shiftwidth automatically.
  {
    "tpope/vim-sleuth",
    event = "VeryLazy",
  },

  -- Support .projectionist.json.
  {
    "tpope/vim-projectionist",
    event = "VeryLazy",
  },

  -- Better folds.
  {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    init = function()
      vim.o.foldenable = true -- enable fold for nvim-ufo
      vim.o.foldlevel = 99 -- set high foldlevel for nvim-ufo
      vim.o.foldlevelstart = 99 -- start with all code unfolded
      vim.o.foldcolumn = "1"
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.api.nvim_set_hl(0, "FoldColumn", { link = "Normal" })
      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function()
          vim.api.nvim_set_hl(0, "FoldColumn", { link = "Normal" })
        end,
      })
    end,
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa", hl = "Normal" },
              { text = { " " }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
            },
          })
        end,
      },
    },
    opts = {
      provider_selector = function(_, _, _)
        return { "treesitter", "indent" }
      end,
    },
  },

  -- Diagnostics panel.
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    keys = {
      { "<D-S-m>", "<CMD>TroubleToggle<CR>", desc = "Trouble" },
    },
  },

  -- Smart split/join.
  {
    "Wansmer/treesj",
    keys = {
      {
        "gJ",
        function()
          require("treesj").join()
        end,
        desc = "Join the object under cursor",
      },
      {
        "gS",
        function()
          require("treesj").split()
        end,
        desc = "Split the object under cursor",
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  -- Scrollbar with diagnostics and Git signs.
  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    opts = {
      folds = 0,
      excluded_buftypes = {
        "nofile",
        "terminal",
      },
      handlers = {
        gitsigns = true,
      },
    },
  },

  -- Automatically jump to last place in file.
  {
    "ethanholz/nvim-lastplace",
    opts = {
      lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
      lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
      lastplace_open_folds = true,
    },
  },

  -- Highlight changes in undo.
  {
    "tzachar/highlight-undo.nvim",
    opts = {},
  },

  -- Search/replace respecting case.
  {
    "tpope/vim-abolish",
    event = "VeryLazy",
  },

  -- Substitute/exchange operators.
  {
    "gbprod/substitute.nvim",
    opts = {},
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

  -- Movements on steroids.
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

  -- Search using Ripgrep and quickfix.
  {
    "mhinz/vim-grepper",
    cmd = { "Grepper", "GrepperRg" },
    keys = {
      { "ga", "<Plug>(GrepperOperator)", desc = "Grep text object/selection", mode = { "n", "x" } },
      { "ga<SPACE>", ":GrepperRg<SPACE>", desc = "Start grep prompt" },
      { "gac", "<CMD>execute 'GrepperRg ' . shellescape(@+)<CR>", desc = "Grep copy", silent = true },
    },
    init = function()
      vim.g.grepper = { open = false }
      vim.api.nvim_create_autocmd("User", {
        pattern = "Grepper",
        command = ":copen",
      })
    end,
  },

  -- Replace buffers in quickfix.
  {
    "stefandtw/quickfix-reflector.vim",
    ft = "qf",
  },

  -- Move lines up/down.
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

  -- Common brackets mappings.
  {
    "tpope/vim-unimpaired",
    event = "VeryLazy",
  },

  -- Autocomplete for commands and search.
  {
    "gelguy/wilder.nvim",
    event = "VeryLazy",
    init = function()
      local wilder = require("wilder")
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
          highlights = {
            border = "Normal", -- highlight to use for the border
          },
          -- 'single', 'double', 'rounded' or 'solid'
          -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
          border = "rounded",
        }))
      )
      -- wilder.set_option(
      --   "renderer",
      --   wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
      --     -- 'single', 'double', 'rounded' or 'solid'
      --     -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
      --     border = "rounded",
      --     max_height = "75%",
      --     min_height = 0,
      --     prompt_position = "top",
      --     reverse = 0,
      --   }))
      -- )
    end,
    opts = {
      modes = { ":", "/", "?" },
    },
  },

  -- Multiple cursors a-la Sublime Text.
  {
    "smoka7/multicursors.nvim",
    opts = {},
    keys = {
      {
        "<C-n>",
        "<CMD>MCstart<CR>",
        desc = "Create a selection for word under the cursor",
      },
    },
  },

  -- ASCII table formatter.
  {
    "dhruvasagar/vim-table-mode",
    ft = { "cucumber", "markdown" },
    init = function()
      vim.g.table_mode_disable_mappings = 1
      vim.g.table_mode_corner = "|"
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "cucumber", "markdown" },
        callback = function(_)
          vim.cmd("silent! :TableModeEnable")
          vim.keymap.set("i", "<Bar>", "<Plug>(table-mode-tableize)", { buffer = true })
        end,
      })
    end,
  },

  -- Alignment operator.
  {
    "Vonr/align.nvim",
    keys = {
      {
        "gl",
        function()
          local align = require("align")
          align.operator(align.align_to_char, { length = 1, reverse = false, preview = false })
        end,
        desc = "Align text object",
      },
    },
  },

  -- Notifications.
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {},
  },

  -- Rails development.
  {
    "tpope/vim-rails",
    event = "VeryLazy",
  },

  -- Automatic completion of pairs.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
    },
    config = function(_, opts)
      local npairs = require("nvim-autopairs")
      npairs.setup(opts)

      -- endwise
      npairs.add_rules(require("nvim-autopairs.rules.endwise-elixir"))
      npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
      npairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))

      -- setup cmp for autopairs
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- Treesitter.
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = {
      auto_install = true,
      ensure_installed = {
        "comment",
        "css",
        "dockerfile",
        "fish",
        "go",
        "graphql",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "markdown_inline",
        "python",
        "ruby",
        "rust",
        "terraform",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        -- "yaml",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = { "ruby" },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },
    },
  },

  -- Indentation text object.
  {
    "michaeljsmith/vim-indent-object",
    event = "VeryLazy",
  },

  -- Commenting.
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n" },
      { "gc", mode = { "n", "v" } },
    },
  },

  -- Automatically switch to nearest root.
  {
    "notjedi/nvim-rooter.lua",
    event = "VeryLazy",
    opts = {
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
    },
  },

  -- gist.github.com integration.
  {
    "Rawnly/gist.nvim",
    cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
    opts = {},
  },
}

return plugins
