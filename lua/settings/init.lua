-- Vim similar variable
local set = vim.opt

-- General Settings
set.scrolloff = 10
set.termguicolors = true
set.laststatus = 3
set.number = true
vim.cmd("set noshowmode")

-- Tab
set.expandtab = true
set.shiftwidth = 4
set.smarttab = true
set.softtabstop = 4

-- Search
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- Split window
set.splitbelow = true
set.splitright = true

-- Vimwiki
vim.cmd("let g:vimwiki_list = [{'path': '~/Documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'auto_diary_index': 1}]") -- Change from default vimwiki syntax to markdown
vim.cmd("autocmd VimEnter * if argc() == 0 | execute 'VimwikiIndex' | endif") -- Execute vimwiki without argument
