return require'packer'.startup(function()
    use "wbthomason/packer.nvim"

    -- Writing
    -- use "Pocco81/TrueZen.nvim"

    -- Languages Server
    use "neovim/nvim-lspconfig"

    -- Auto complete
    use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"

    -- Statusline
    use {
  "nvim-lualine/lualine.nvim",
  requires = { "kyazdani42/nvim-web-devicons", opt = true }
}
   -- Themes 
   use { 'Everblush/everblush.nvim', as = 'everblush' }

   -- Vimwiki
   use "vimwiki/vimwiki"

end)
