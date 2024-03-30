
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
require('markdown-conceal')

-- Themes
vim.cmd("colorscheme everblush")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
