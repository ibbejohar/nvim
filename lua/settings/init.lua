local set = vim.opt
local bind = vim.keymap.set

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Line number
set.number = true
set.relativenumber = true

-- Pane spliting
set.splitbelow = true
set.splitright = true

-- Wraping line
set.wrap = false

-- Tab to spaces
set.expandtab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

-- Sync with system clipboard
set.clipboard = "unnamedplus"

-- Start scrolling when X line left
set.scrolloff = 10

-- Visual mode
set.virtualedit = "block"

-- Live Preview
set.inccommand = "split"

-- Search
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- Colors
set.termguicolors = true

-- Concealer
set.conceallevel = 2

-- She Bang
vim.cmd("let @b=\"i#!/usr/bin/env bash\"")

bind("n", "<leader>ww", ":Neorg index<CR>", {})
bind("n", "<leader>wr", ":Neorg return<CR>", {})
-- viwo<Esc>
bind("n", "<leader>l", "@r", {})
