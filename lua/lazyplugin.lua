-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { import = "plugins.git" },
        { import = "plugins.fzf" },
        { import = "plugins.tokyonight" },
        { import = "plugins.oil" },
        { import = "plugins.lualine" },
        { import = "plugins.autopairs" },
        { import = "plugins.smoothie" },
        { import = "plugins.nix" },
        { import = "plugins.treesitter" },
        { import = "plugins.neorg" },
        --{ import = "plugins.vimwiki" },
        --{ import = "plugins.markdown" },
        { import = "plugins.lsp-config" },
        { import = "plugins.auto-save" },
        { import = "plugins.auto-table" },
        { import = "plugins.vim-pencil" },
        { import = "plugins.zen-mode" },
        { import = "plugins.debugging" },
        --{ import = "plugins.image" },
    },
    install = { colorscheme = { "tokyonight-night"} },
})
    vim.cmd.colorscheme "tokyonight-night"
    vim.opt.cursorline = true
    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none"})
    vim.api.nvim_set_hl(0, "ENDOfBuffer", { bg = "none"})
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none"})
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none"})
    vim.api.nvim_set_hl(0, "VertSplit", { bg = "none"})
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", fg = "#225222"})
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "none"})
