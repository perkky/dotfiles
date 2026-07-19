vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("n", "vs", ":vs<CR>", { noremap = true })

vim.keymap.set("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true, desc = "which_key_ignore"})
vim.keymap.set("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true, desc = "which_key_ignore"})

vim.keymap.set("n", "*", ":keepjumps normal! mi*`i<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-c>", "gcc", { desc = "Comment Out Line" })
vim.api.nvim_set_keymap("v", "<C-c>", "gc", { desc = "Comment Out Line" })
vim.keymap.set("n", "gl", "$", { desc = "Go to end of line" })
vim.keymap.set("n", "gh", "^", { desc = "Go to start of line" })
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- LSP
vim.keymap.set('n', '<leader>D', vim.lsp.buf.declaration, { noremap=true, silent=true, desc = "LSP Declaration"})
vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, { noremap=true, silent=true, desc = "LSP Definition"})
vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation, { noremap=true, silent=true, desc = "LSP Implementation"})
vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, { noremap=true, silent=true, desc = "LSP References"})
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, { desc = "LSP Hover" })
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = "LSP Code Action" })
vim.keymap.set('v', '<leader>a', vim.lsp.buf.code_action, { desc = "LSP Code Action" })

-- Smart search navigation (n always goes forward, N always backward)
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Better indenting (stay in visual mode) (removed as . is good enough)
--vim.keymap.set("v", "<", "<gv")
--vim.keymap.set("v", ">", ">gv")

-- Dont replace clipboard with deleted text when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Quickfix list
-- vim.keymap.set("n", "<leader>l", function()
--   local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
--   if not success and err then
--     vim.notify(err, vim.log.levels.ERROR)
--   end
-- end, { desc = "Quickfix List" })
vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
