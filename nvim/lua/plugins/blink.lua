-- Lazy load on first insert mode entry
local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	group = group,
	once = true,
	callback = function()
        vim.pack.add({
            {
                src = "https://github.com/saghen/blink.cmp",
                version = vim.version.range("^1"),
            },
        })
		require("blink.cmp").setup({
            keymap = {
                preset = 'super-tab',
                ['<Tab>'] = {'select_next', 'fallback'},
                ['<S-Tab>'] = {'select_prev', 'fallback'},
            },
            cmdline = { enabled = false },
			appearance = {
				nerd_font_variant = "mono",
				use_nvim_cmp_as_default = true,
			},
			completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 500 },
                list = { selection = { preselect = false } },
                menu = { border = 'single', draw = { columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } } } },
			},
            sources = {
            default = { 'lsp', 'buffer', 'path', 'snippets' },
            providers = {
                        lsp = {
                            min_keyword_length = 0,
                            score_offset = 0,
                            fallbacks = {},
                        },
                        path = {
                            min_keyword_length = 0,
                            fallbacks = {},
                        },
                        snippets = {
                            min_keyword_length = 2,
                            fallbacks = {},
                        },
                        buffer = {
                            min_keyword_length = 2,
                            fallbacks = {},
                        },
                    },
            },
			fuzzy = { implementation = "prefer_rust_with_warning" },
            opts_extend = { "sources.default" },
		})
	end,
})
