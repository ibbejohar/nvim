return {
    "neovim/nvim-lspconfig",
    dependencies = {
        --{ "williamboman/mason.nvim", opts = {}, },
       -- "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "mfussenegger/nvim-dap",
        "hrsh7th/vim-vsnip",
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                }
            },
        },
    },
    config = function()
        -- Variables
        local opts = { noremap=true, silent=true }
        local keymap = vim.keymap.set 
        local bufopts = { noremap=true, silent=true, buffer=bufnr }

        local lsp_flags = {
            debounce_text_changes = 150,  -- Set debounce time for change events
        }

        --require("mason").setup()
        -- require("mason-lspconfig").setup({
            -- ensure_installed = { "lua-language-server" }
        -- })

        -- Mappings
        local on_attach = function(client, bufnr)
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

            keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
            keymap("n", "gd", vim.lsp.buf.definition, bufopts)
            keymap("n", "K", vim.lsp.buf.hover , bufopts)
            keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
            keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
            keymap("n", "gt", vim.lsp.buf.type_definition, bufopts)

        end

        vim.lsp.config("rust_analyzer", {
            on_attach = on_attach,
            flags = lsp_flags,
            settings = {
                ["rust-analyzer"] = {
                    assist = { importGranularity = "module", importPrefix = "self" },
                    cargo = { loadOutDirsFromCheck = true },
                    procMacro = { enable = true },
                },
            },
        })


        -- Python
        -- require("lspconfig")["pyright"].setup{
            --     on_attach = on_attach,
            --     flags = lsp_flags,
            --     settings = {
                --         ["pyright"] = {}
                --     }
                -- }

                vim.lsp.config("clangd", {
                    on_attach = on_attach,
                    flags = lsp_flags,
                    settings = {
                        ["clangd"] = {}
                    }
                })
                vim.lsp.config("lua_ls", {
                    on_attach = on_attach,
                    flags = lsp_flags,
                    settings = {
                        ["lua-language-server"] = {},
                        Lua = {
                            telemetry = { enable = false },
                            completion = {
                                callSnippet = "Replace",
                            }
                        }
                    }
                })
                vim.lsp.config("nixd", {
                    on_attach = on_attach,
                    flags = lsp_flags,
                    settings = {
                        ["nixd"] = {}
                    }
                })

                vim.lsp.enable({"rust_analyzer", "clangd", "lua_ls", "nixd"})

                -- Bash
                vim.api.nvim_create_autocmd('FileType', {
                    pattern = 'sh',
                    callback = function()
                        vim.lsp.start({
                            name = 'bash-language-server',
                            cmd = { 'bash-language-server', 'start' },
                        })
                    end,
                })


                local cmp = require("cmp")
                cmp.setup({
                    snippet = {
                        -- REQUIRED - you must specify a snippet engine
                        expand = function(args)
                            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        end,
                    },
                    window = {
                        -- completion = cmp.config.window.bordered(),
                        -- documentation = cmp.config.window.bordered(),
                    },
                    mapping = cmp.mapping.preset.insert({
                        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-f>'] = cmp.mapping.scroll_docs(4),
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<C-e>'] = cmp.mapping.abort(),
                        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    }),
                    sources = cmp.config.sources({
                        { name = 'nvim_lsp' },
                        { name = 'vsnip' }, -- For vsnip users.
                        -- { name = 'luasnip' }, -- For luasnip users.
                        -- { name = 'ultisnips' }, -- For ultisnips users.
                        -- { name = 'snippy' }, -- For snippy users.
                        { name = 'neorg' },
                    }, {
                        { name = 'buffer' },
                    })
                })

                -- Set configuration for specific filetype.
                cmp.setup.filetype('gitcommit', {
                    sources = cmp.config.sources({
                        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
                    }, {
                        { name = 'buffer' },
                    })
                })

                -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
                cmp.setup.cmdline('/', {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = {
                        { name = 'buffer' }
                    }
                })

                -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
                cmp.setup.cmdline(':', {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources({
                        { name = 'path' }
                    }, {
                        { name = 'cmdline' }
                    })
                })

            end

        }
