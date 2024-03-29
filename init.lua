
-- Modules
require('settings')
require('plugins')
require('keybinding')
require('nvim-cmp')
require('statusline')
require('lsp-config')
require('tree-sitter')
require('mason-lsp')
require('fuzzy-finder')

-- Themes
vim.cmd("colorscheme everblush")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    default = "~/Documents/notes",
                }
            }
        }
    }
}
