return {
  -- Ensure tmux works with neovim windows and vice versa
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    opts = {},
    keys = {
        { "<M-h>", mode = "n", function() require("nvim-tmux-navigation").NvimTmuxNavigateLeft() end, desc = "Go to Left Window" },
        { "<M-j>", mode = "n", function() require("nvim-tmux-navigation").NvimTmuxNavigateDown() end, desc = "Go to Lower Window" },
        { "<M-k>", mode = "n", function() require("nvim-tmux-navigation").NvimTmuxNavigateUp() end, desc = "Go to Upper Window" },
        { "<M-l>", mode = "n", function() require("nvim-tmux-navigation").NvimTmuxNavigateRight() end, desc = "Go to Right Window" },
    },
  },

  -- Telescope integration
  {
    "nvim-telescope/telescope.nvim",
    -- optional = true,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files", },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep in files", },
      { "<leader>fc", "<cmd>Telescope quickfix<cr>", desc = "Grep in files", },
      { "<leader>fl", "<cmd>Telescope loclist<cr>", desc = "Grep in files", },
    },
  },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
    -- fill any relevant options here
    },
  },
}
