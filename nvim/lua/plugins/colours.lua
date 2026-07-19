vim.pack.add({
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/rebelot/kanagawa.nvim",
    "https://github.com/sainnhe/sonokai",
})

require('kanagawa').setup({
    colors = { theme = { all = { ui = { bg_gutter = "none" } } } }
})
vim.cmd("colorscheme kanagawa")
