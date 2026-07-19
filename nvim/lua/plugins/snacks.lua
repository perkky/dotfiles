vim.pack.add({
    "https://github.com/folke/snacks.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/tpope/vim-fugitive",
})

require("snacks").setup({
    animate = { enabled = true },
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    dim = { enabled = true },
    explorer = { enabled = true, replace_netrw = true },
    image = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    layout = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scratch = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    terminal = { enabled = false },
    toggle = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },

    picker = {
        sources = {
            files = {
                hidden = true,
                ignored = true,
                win = {
                    input = {
                        keys = {
                            ["<S-h>"] = "toggle_hidden",
                            ["<S-i>"] = "toggle_ignored",
                            ["<S-f>"] = "toggle_follow",
                            ["<C-y>"] = { "yazi_copy_relative_path", mode = { "n", "i" } },
                        },
                    },
                },
                exclude = {
                    "**/.git/*",
                    "**/node_modules/*",
                    "**/.yarn/cache/*",
                    "**/.yarn/install*",
                    "**/.yarn/releases/*",
                    "**/.pnpm-store/*",
                    "**/.idea/*",
                    "**/.DS_Store",
                    "build/*",
                    "coverage/*",
                    "dist/*",
                    "hodor-types/*",
                    "**/target/*",
                    "**/public/*",
                    "**/digest*.txt",
                    "**/.node-gyp/**",
                },
            },
            grep = {
                hidden = true,
                ignored = true,
                win = {
                    input = {
                        keys = {
                            ["<S-h>"] = "toggle_hidden",
                            ["<S-i>"] = "toggle_ignored",
                            ["<S-f>"] = "toggle_follow",
                        },
                    },
                },
                exclude = {
                    "**/.git/*",
                    "**/node_modules/*",
                    "**/.yarn/cache/*",
                    "**/.yarn/install*",
                    "**/.yarn/releases/*",
                    "**/.pnpm-store/*",
                    "**/.venv/*",
                    "**/.idea/*",
                    "**/.DS_Store",
                    "**/yarn.lock",
                    "build*/*",
                    "coverage/*",
                    "dist/*",
                    "certificates/*",
                    "hodor-types/*",
                    "**/target/*",
                    "**/public/*",
                    "**/digest*.txt",
                    "**/.node-gyp/**",
                },
            },
            grep_buffers = {},
            explorer = {
                hidden = true,
                ignored = true,
                supports_live = true,
                auto_close = true,
                diagnostics = true,
                diagnostics_open = false,
                focus = "list",
                follow_file = true,
                git_status = true,
                git_status_open = false,
                git_untracked = true,
                jump = { close = true },
                tree = true,
                watch = true,
                exclude = {
                    ".git",
                    ".pnpm-store",
                    ".venv",
                    ".DS_Store",
                    "**/.node-gyp/**",
                },
            },
        },
    },
})

-- stylua: ignore start
local keymaps = {
    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    {
      "<leader>fb", function()
        Snacks.picker.buffers({
          win = {
            input = {
              keys = {
                ["dd"] = "bufdelete",
                ["<c-d>"] = { "bufdelete", mode = { "n", "i" } },
              },
            },
            list = { keys = { ["dd"] = "bufdelete" } },
          },
        })
      end, desc = "Buffers",
    },
    -- find
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { '<leader>f/', function() Snacks.picker.search_history() end, desc = "Search History" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>fu", function() Snacks.picker.undo() end, desc = "Undo History" },
    { "<leader>l", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>fC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    -- buffers
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer", mode = { "n" }, },
    -- Other
    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>cr", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    -- { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<leader>gb", ":Git blame<cr>", desc = "Git Blame" },
}
-- stylua: ignore end
for _, map in ipairs(keymaps) do
    local opts = { desc = map.desc }
    if map.silent ~= nil then
        opts.silent = map.silent
    end
    if map.noremap ~= nil then
        opts.noremap = map.noremap
    else
        opts.noremap = true
    end
    if map.expr ~= nil then
        opts.expr = map.expr
    end

    local mode = map.mode or "n"
    vim.keymap.set(mode, map[1], map[2], opts)
end
