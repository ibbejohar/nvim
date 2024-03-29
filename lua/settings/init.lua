-- Vim similar variable
local set = vim.opt
-- General Settings
vim.g.mapleader = " "
set.scrolloff = 10
set.termguicolors = true
set.laststatus = 3
set.number = true
vim.cmd("set noshowmode")
set.clipboard = "unnamedplus"

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
--vim.cmd("autocmd VimEnter * if argc() == 0 | execute 'VimwikiIndex' | endif") -- Execute vimwiki without argument

-- Zen mode
vim.cmd("nnoremap <leader><ENTER> :ZenMode<CR>")

-- Fzf
vim.cmd("nnoremap <leader>f :FzfLua files<CR>")
vim.cmd("nnoremap <leader>b :FzfLua buffers<CR>")

-- Change colorscheme
vim.cmd("nnoremap <leader>c :colorscheme ayu<CR>")
vim.cmd("nnoremap <leader>C :colorscheme everblush<CR>")

vim.cmd("let ayucolor='light'")
vim.cmd("nnoremap <leader>d :hi Conceal guibg=NONE ctermbg=NONE<CR>")
vim.cmd("let @b=\"i#!/usr/bin/env bash\"")

-- Change back cursor when exiting neovim (For Alcrritty)
vim.cmd
[[
    augroup change_cursor
        au!
        au ExitPre * :set guicursor=a:ver90
    augroup END
]]
