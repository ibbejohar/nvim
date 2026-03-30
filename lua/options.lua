local opt = vim.opt
local map = vim.keymap.set
vim.g.mapleader = " "
vim.g.maplocalleader= ","
vim.g.have_nerd_font = true

opt.termguicolors = true
opt.showmode = false

opt.relativenumber = true
opt.number = true
--opt.statuscolumn = "%s %l %r "
opt.signcolumn = "auto"

opt.splitright = true
opt.splitbelow = true

opt.swapfile = true
opt.breakindent = true
opt.undofile = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.updatetime = 250
opt.list = true
opt.inccommand = "split"
opt.scrolloff = 10

opt.expandtab = true
opt.shiftwidth = 4
opt.smarttab = true
opt.softtabstop = 4

opt.showmatch = true
opt.cmdheight = 0

map("n", "<leader>o", ":update<CR> :source<CR>")
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Disables command history pane
map("n", "q:", "<nop>")
-- Disables macro key
map("n", "q", "<nop>")

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.schedule(function()
    opt.clipboard = "unnamedplus"
end)
-- vim.cmd("let g:vimwiki_list = [{'path': '~/Documents/notes', 'syntax': 'markdown', 'ext': '.md'}]")
-- vim.cmd("let g:vimwiki_global_ext = 0")

vim.cmd('let @r="viw<Esc>bi{:<Esc>ea:}<Esc>"')

map("n", "<leader>l", function()
    vim.cmd("normal! viwb\\e")
end
)
