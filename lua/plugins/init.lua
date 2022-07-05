return require'packer'.startup(function() use "wbthomason/packer.nvim"

    -- Writing
    use {"folke/zen-mode.nvim", config = "require('zen-mode-config')"}
    use "preservim/vim-pencil"  -- Formatting
    use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Languages Server
    use "neovim/nvim-lspconfig"
    use "nvim-lua/plenary.nvim"
    use "mfussenegger/nvim-dap"

    -- Auto complete
    use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"

    -- Statusline
    use {
  "nvim-lualine/lualine.nvim",
  requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
   -- Themes 
   use { 'Everblush/everblush.nvim', as = 'everblush' }
   use 'ayu-theme/ayu-vim'

   -- Vimwiki
   use "vimwiki/vimwiki"

   -- Smooth Scrolling
   use "psliwka/vim-smoothie"

   -- Fuzzy Finder
   use { 'ibhagwan/fzf-lua',
  -- optional for icon support
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

end)
