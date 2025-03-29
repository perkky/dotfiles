return {
  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- Auto pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {
        modes = { insert = true, command = true, terminal = false },
        -- skip autopair when next character is one of these
        skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
        -- skip autopair when the cursor is inside these treesitter nodes
        skip_ts = { "string" },
        -- skip autopair when next character is closing pair
        -- and there are more closing pairs than opening pairs
        skip_unbalanced = true,
        -- better deal with markdown code blocks
        markdown = true,
    },
  },

  -- comments
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- snacks
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        notifier = { enabled = true },
        scope = { enabled = true },
        statuscolumn = { enabled = true }, -- TODO - is this needed?!?!?!
        words = { enabled = true },
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        -- scratch = { enabled = true },
    },
    keys = {
      { "<leader>n", function() Snacks.notifier.show_history() end,  desc = "Notification History" }
    },
  },

  -- trouble
  {
    "folke/trouble.nvim",
    optional = true,
    keys = {
      { "<leader>cs", false },
    },
  },

  {
    'tpope/vim-fugitive' ,
    lazy = false,
    keys = {
      { "<leader>gb", ":Git blame<cr>", desc = "Git blame" },
    },
  },

  -- Areial symbol browser
  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    opts = function()
      ---@type table<string, string[]>|false
      local opts = {
        attach_mode = "global",
        backends = { "lsp", "treesitter", "markdown", "man" },
        show_guides = true,
        layout = {
          resize_to_content = false,
          win_opts = {
            winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
            signcolumn = "yes",
            statuscolumn = " ",
          },
        },
        -- stylua: ignore
        guides = {
          mid_item   = "├╴",
          last_item  = "└╴",
          nested_top = "│ ",
          whitespace = "  ",
        },
      }
      return opts
    end,
    keys = {
      { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
    },
  },

  -- Help menu for keymaps
  -- TODO: HAD TO REMOVE AS IT DOESNT LIKE gj AND CEEBS FIXING
  -- {
  --   "folke/which-key.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --       delay = 100,
  --       preset = "helix",
  --       ---@param ctx { mode: string, operator: string }
  --       defer = function(ctx)
  --         return vim.list_contains({ "g", "g" }, ctx.operator)
  --       end,
  --   },
  --   keys = {
  --     {
  --       "<leader>?",
  --       function()
  --         require("which-key").show({ global = false })
  --       end,
  --       desc = "Buffer Local Keymaps (which-key)",
  --     },
  --   },
  -- },
}
