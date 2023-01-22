require('basics')
require('coc')
require('colours')
require('telescope')
require('wikivim')
require('nvim-autopairs').setup{}
require('nvim-autopairs').remove_rule('\'')

vim.cmd("source ~/.config/nvim/others.vim")

require('plugins')
