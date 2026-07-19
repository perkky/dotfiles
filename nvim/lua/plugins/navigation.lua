vim.pack.add({
    "https://github.com/alexghergh/nvim-tmux-navigation",
})
vim.keymap.set("n", "<M-h>", function() require("nvim-tmux-navigation").NvimTmuxNavigateLeft() end, { desc = "Go to Left Window" });
vim.keymap.set("n", "<M-j>", function() require("nvim-tmux-navigation").NvimTmuxNavigateDown() end, { desc = "Go to Lower Window" });
vim.keymap.set("n", "<M-k>", function() require("nvim-tmux-navigation").NvimTmuxNavigateUp() end, { desc = "Go to Upper Window" });
vim.keymap.set("n", "<M-l>", function() require("nvim-tmux-navigation").NvimTmuxNavigateRight() end, { desc = "Go to Right Window" });
