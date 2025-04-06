return {
  -- the colorscheme should be available when starting Neovim
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    -- optional = true,
    opts = {
      integrations = { overseer = true },
    },
  },

  {
    "sainnhe/sonokai",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[let g:sonokai_style = 'andromeda' ]])
      vim.cmd([[let g:sonokai_better_performance = 1 ]])
      vim.cmd([[colorscheme sonokai]])
    end,
  },
}


