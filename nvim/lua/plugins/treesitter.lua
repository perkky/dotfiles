vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
    },
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
        version = "main",
    },
})

require("nvim-treesitter").setup({})
require("nvim-treesitter").install({
    "bash",
    "c",
    "comment",
    "diff",
    "dockerfile",
    "gitcommit",
    "gitignore",
    "ini",
    "json",
    "lua",
    "luadoc",
    "luap",
    "make",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "regex",
    "rust",
    "sql",
    -- "systemverilog",
    "yaml",
})

require("nvim-treesitter-textobjects").setup({
    select = {
        enable = true,
        lookahead = true,
        selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
        },
        include_surrounding_whitespace = false,
    },
    move = {
        enable = true,
        set_jumps = true,
    },
})
