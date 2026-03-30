return {
    "nvim-neorg/neorg",
    dependencies = {
        "benlubas/neorg-interim-ls",
    },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.keybinds"] = {
                    defaults_keybinds = true,
                },
                ["core.pivot"] = {},
                ["core.concealer"] = {
                    config = {
                        icon_preset = "diamond",
                        icons = {
                            code_block = {
                                conceal = true,
                                content_only = true,
                                insert_enabled = true,
                            },
                        },
                    }
                },
                ["core.itero"] = {},
                ["core.promo"] = {},
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp"
                    }
                },
                ["core.export"] = {},
                ["core.ui.calendar"] = {},
                ["core.storage"] = {},
                ["core.summary"] = {},
                ["core.integrations.nvim-cmp"] = {},
                ["core.integrations.treesitter"] = {},
                ["core.integrations.image"] = {},
                ["core.esupports.metagen"] = {
                    config = {
                        timezone = "implicit-local",
                        type = "none",
                        update_date = true
                    },
                },
                -- ["core.latex.renderer"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/Documents/notes",
                        },
                        default_workspace = "notes",
                    },
                },
            },
        }

        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
        vim.g.maplocalleader = ","
         vim.keymap.set("n", "<leader>ww", ":Neorg index<CR>", {})
         vim.keymap.set("n", "<leader>wr", ":Neorg return<CR>", {})

    end,
}
