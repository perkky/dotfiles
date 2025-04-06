return {
  -- Completion
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',

    opts = {
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
        preset = 'super-tab',
        ['<Tab>'] = {'select_next', 'fallback'},
        ['<S-Tab>'] = {'select_prev', 'fallback'},
    },

    appearance = {
      nerd_font_variant = 'mono'
    },

    cmdline = { enabled = false },

    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        list = { selection = { preselect = false } },
        menu = { border = 'single', draw = { columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } } } },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
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

    fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" },
    -- config = function(opts)
    --   opts.sources.providers.lsp.fallbacks = {}
    --   opts.sources.providers.path.fallbacks = {}
    --   require("saghen/blink.cmp").setup(opts)
    -- end,
  },

  -- Treesitter is a new parser generator tool that we can
  -- use in Neovim to power faster and more accurate
  -- syntax highlighting.
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    -- event = { "VeryLazy" },
    lazy = false, -- load treesitter early when opening a file from the cmdline
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treesitter** module to be loaded in time.
      -- Luckily, the only things that those plugins need are the custom queries, which we make available
      -- during startup.
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-space>", desc = "Increment Selection" },
      { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    opts_extend = { "ensure_installed" },
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "verilog",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    },
    ---@param opts TSConfig
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    'nvim-lspconfig',
    config = function(opts)
        require('lspconfig').clangd.setup{
            -- on_attach = function()
            --  -- do stuff here....
            -- end
            cmd = {
                    "/home/ryan/clangd_19.1.2/bin/clangd",
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
                    -- "--rename-file-limit=500",
                    "--query-driver=/opt/imc/gcc-*",
                    "-j=64"
                },
            filetypes = {"hpp", "h", "c", "cpp", "objc", "objcpp"},
            -- capabilities = capabilities,
        }
        require('lspconfig').svlangserver.setup {
            on_attach = on_attach,
            settings = {
                systemverilog = {
                    includeIndexing = {
                        'hw/**/*.{sv,svh}',
                        'bazel-bin/hw/svjt/**/*.{sv,svh}',
                        'bazel-bin/protocols/**/*.{sv,svh}',
                        'bazel-bin/registerFile/**/*.{sv,svh}',
                        'bazel-fpga/external/**/*.{sv,svh}'
                    },
                    excludeIndexing = {'bazel-fpga/external/verilator_v4.224/**/*.{v,vh,sv,svh}'},
                    defines = {'DESIGN_SEL=designs_pkg::FALCON_NETWORK', 'BOARD_TYPE=boards_pkg::VU3P_SG2_IMC', 'HW_LINTING'},
                    launchConfiguration = {'/home/git/fpga/bazel-out/k8-opt-exec-ST-7a7a5ae062ee/bin/external/verilator_v4.224/verilator_executable -sv --lint-only -Wwarn-style --Wno-PINCONNECTEMPTY --cdc --Wno-LITENDIAN --Wno-TIMESCALEMOD --Wno-CASEX +libext+.v +libext+.sv'}
                }
            }
        }
    end,
  }
}
