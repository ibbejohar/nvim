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
    },
    install = { colorscheme = { "tokyonight-night"} },
})
    vim.cmd.colorscheme "tokyonight-night"
    vim.opt.cursorline = true
    vim.cmd [[
    highlight Normal       ctermbg=none guibg=none
    highlight NormalNC     ctermbg=none guibg=none
    highlight EndOfBuffer  ctermbg=none guibg=none
    highlight LineNr       ctermbg=none guibg=none
    highlight SignColumn   ctermbg=none guibg=none
    highlight VertSplit    ctermbg=none guibg=none
    highlight CursorLineNr guifg=#228B22 guibg=none
    highlight CursorLine ctermbg=none guibg=none
    ]]
