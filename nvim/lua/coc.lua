vim.api.nvim_set_keymap("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? '<TAB>' : coc#refresh()", {noremap = true, silent = true, expr = true})

vim.api.nvim_set_keymap("i", "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'", {noremap = true, silent = true, expr = true})
