vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}

vim.lsp.config('clangd', {
    cmd = {
            "/usr/bin//clangd",
            -- "--all-scopes-completion",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--header-insertion=iwyu",
            "--include-cleaner-stdlib",
            "--limit-results=1000",
            "--limit-references=10000",
            "--parse-forwarding-functions",
            "--pch-storage=memory",
            "--offset-encoding=utf-16",
            -- "--rename-file-limit=500",
            -- "--query-driver=/opt/gcc-*",
            "-j=64"
        },
        filetypes = {"hpp", "h", "c", "cpp", "objc", "objcpp"},
})
vim.lsp.config('verible', {
    filetypes = {"verilog", "systemverilog"},
})
vim.lsp.enable('clangd')
vim.lsp.enable('verible')
