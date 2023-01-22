vim.g.mapleader = " "
vim.o.number  = true

vim.o.relativenumber = true
vim.o.wrap = true
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.cursorline = true
vim.o.colorcolumn = '200'
vim.o.shiftwidth = 4
vim.o.numberwidth = 4
vim.o.termguicolors = true
vim.o.mouse = 'a'
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 200
vim.o.tagcase = "match"
vim.o.termguicolors = true

vim.cmd [[ autocmd BufWritePre * :call TrimWhitespace() ]]

-- vim.o.swapfile = false
-- vim.o.splitbelow = true
-- vim.o.splitright = true
-- vim.o.showmode = false
-- vim.o.showtabline = 2
-- vim.o.signcolumn = 'yes'

vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', 'vs', ':vs<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'hs', ':sp<CR>', { noremap = true })

vim.api.nvim_set_keymap("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
vim.api.nvim_set_keymap("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })


-- vim.api.nvim_set_keymap('n', '<M-l>', '<C-W>l', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<M-h>', '<C-W>h', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<M-k>', '<C-W>k', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<M-j>', '<C-W>j', { noremap = true })
vim.api.nvim_set_keymap('n', "<M-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<M-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<M-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<M-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<C-c>', ':Commentary<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-c>', ':Commentary<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>s', ':HopChar2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gb', ':Git blame<CR>', { noremap = true, silent = true })
