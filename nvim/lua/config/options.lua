vim.g.mapleader = " "
vim.o.number = true

vim.o.relativenumber = true
vim.o.wrap = true
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.cursorline = true
vim.o.colorcolumn = "200"
vim.o.shiftwidth = 4
vim.o.numberwidth = 4
vim.o.termguicolors = true
vim.o.mouse = "a"
vim.o.hidden = true
vim.o.updatetime = 200
vim.o.tagcase = "match"
vim.o.undodir = "/home/.config/nvim/undodir"
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.grepprg = "rg --vimgrep"
vim.o.list = true
vim.o.virtualedit = "block"

vim.o.scrolloff = 10 -- Keep 10 lines above/below cursor

-- Indentation
vim.o.smartindent = true -- Smart auto-indenting
vim.o.autoindent = true -- Copy indent from current line

-- Search settings
vim.o.incsearch = true -- Show matches as you type

-- Visual settings
vim.o.signcolumn = "yes" -- Always show sign column
vim.o.showmatch = true -- Highlight matching brackets
vim.o.matchtime = 2 -- How long to show matching bracket
vim.o.cmdheight = 1 -- Command line height
vim.o.pumheight = 10 -- Popup menu height
vim.o.pumblend = 10 -- Popup menu transparency
vim.o.winblend = 0 -- Floating window transparency
vim.o.completeopt = "menu,menuone,noselect"
vim.o.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
vim.o.concealcursor = "" -- Don't hide cursor line markup
vim.o.synmaxcol = 300 -- Syntax highlighting limit
vim.o.winminwidth = 5 -- Minimum window width

-- File handling
vim.o.backup = false -- Don't create backup files
vim.o.writebackup = false -- Don't create backup before writing
vim.o.swapfile = false -- Don't create swap files
vim.o.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
vim.o.ttimeoutlen = 0 -- Key code timeout
vim.o.autoread = true -- Auto reload files changed outside vim

-- Behavior settings
vim.o.errorbells = false -- No error bells
vim.o.backspace = "indent,eol,start" -- Better backspace behavior
vim.o.autochdir = false -- Don't auto change directory
vim.opt.iskeyword:append("-") -- Treat dash as part of word
vim.opt.path:append("**") -- include subdirectories in search
vim.o.modifiable = true -- Allow buffer modifications
vim.o.encoding = "UTF-8" -- Set encoding

-- Folding settings
vim.opt.smoothscroll = true

-- Better diff options
vim.opt.diffopt:append("linematch:60")

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("/home/.config/nvim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

vim.g.autoformat = true

vim.opt.fillchars = {
  diff = "╱",
}

vim.opt.jumpoptions = "view"
vim.opt.laststatus = 2 -- global statusline
-- vim.opt.linebreak = true -- Wrap lines at convenient points
vim.opt.shiftround = true -- Round indent
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })

vim.g.markdown_recommended_style = 0

vim.filetype.add({
  extension = {
    env = "dotenv",
  },
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
  },
  pattern = {
    ["[jt]sconfig.*.json"] = "jsonc",
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
})
