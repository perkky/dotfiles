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
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 200
vim.o.tagcase = "match"
vim.o.termguicolors = true vim.o.undofile = true
vim.o.grepprg = "rg --vimgrep"
vim.o.list = true
vim.o.virtualedit = "block"

vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "vs", ":vs<CR>", { noremap = true })

vim.api.nvim_set_keymap("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true, desc = "which_key_ignore"})
vim.api.nvim_set_keymap("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true, desc = "which_key_ignore"})

vim.api.nvim_set_keymap("n", "*", ":keepjumps normal! mi*`i<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Open lsp diagnostic" })
vim.api.nvim_set_keymap("n", "<C-c>", "gcc", { desc = "comment" })
vim.api.nvim_set_keymap("v", "<C-c>", "gc", { desc = "comment" })

vim.diagnostic.config({ virtual_text = true });

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function()
		-- cache current window view, since :s command moves the cursor to last substitution
		local view = vim.fn.winsaveview()
		vim.cmd([[%s:\s\+$::e]])
		vim.fn.winrestview(view) -- restore cached window view
	end,
})

local function createCompiledWindow(fileName, compilerBufferName)
    local compiler_buffer_id = vim.fn.bufnr(compilerBufferName);
    if not vim.api.nvim_buf_is_valid(compiler_buffer_id) then
        vim.api.nvim_command("rightbelow vsplit " .. compilerBufferName);
        compiler_buffer_id = vim.fn.bufnr(compilerBufferName);
    end

    -- local file_buffer_id = vim.fn.bufnr(fileName);
    -- local compiler = string.sub(vim.api.nvim_buf_get_lines(file_buffer_id, 0, 1, false)[0], 2);

    vim.api.nvim_buf_call(compiler_buffer_id, function()
        vim.api.nvim_command("let current_buffer_name = bufname('%') | execute 'enew' | execute 'bwipeout! ' . current_buffer_name | execute 'file ' . current_buffer_name | call jobstart('cat " .. fileName .. " | g++ -x c++ --std=c++20 -O3 -Wall -Werror -Wno-unused-variable -o test - && ./test', {'term':v:true}) | execute 'file ' current_buffer_name | execute 'setlocal norelativenumber' | execute 'setlocal nonumber'")
    end)
end

vim.api.nvim_create_user_command("AttachCompiler", function()
    local filename = vim.fn.expand("%")
    local compilerFilename = filename .. '_compiler'
    createCompiledWindow(filename, compilerFilename)
    vim.api.nvim_create_autocmd({"BufWritePost"}, {
        pattern = {filename},
        -- command = vim.api.nvim_call_function("createCompiledWindow(".. filename ", 'compiler')")
        callback = function()
            createCompiledWindow(filename, compilerFilename)
        end
    })
end, {})
