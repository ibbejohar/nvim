return require'packer'.startup(function() use "wbthomason/packer.nvim"

    -- Writing
    use {"folke/zen-mode.nvim", config = "require('zen-mode-config')"}
    use "preservim/vim-pencil"  -- Formatting
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    -- Languages Server
    use "neovim/nvim-lspconfig"
    use "nvim-lua/plenary.nvim"
    use "mfussenegger/nvim-dap"
    use "hrsh7th/vim-vsnip"

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
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Vimwiki
--    use "vimwiki/vimwiki"
      
    -- Smooth Scrolling
    use "psliwka/vim-smoothie"
    -- Fuzzy Finder
    use {
        "nvim-telescope/telescope.nvim", 
        tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- NIX
    use "LnL7/vim-nix"
    -- Tree sitter
    use "nvim-treesitter/nvim-treesitter"
    use "nvim-treesitter/nvim-treesitter-textobjects"
    -- Mason
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    -- Neorg
    use {
    "nvim-neorg/neorg",
    rocks = { "lua-utils.nvim", "nvim-nio", "nui.nvim", "plenary.nvim" },
    run = ":Neorg sync-parsers",
    tag = "v8.0.0",
    } 
end)
