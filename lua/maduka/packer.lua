-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	  "folke/tokyonight.nvim",
	  lazy = false,
	  priority = 1000,
	  opts = {},
  }

  use{ 
	  'rose-pine/neovim', 
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use {
	  "ThePrimeagen/harpoon",
	  branch = "harpoon2",
	  requires = { {"nvim-lua/plenary.nvim"} }
  }
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},}
      }
  use 'github/copilot.vim'
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'tpope/vim-commentary'
  -- https://github.com/nvim-treesitter/nvim-treesitter-context
  use 'romgrk/nvim-treesitter-context'

  use 'stevearc/dressing.nvim'
  use 'MunifTanjim/nui.nvim'

  -- Optional dependencies
  use 'hrsh7th/nvim-cmp'
  use 'nvim-tree/nvim-web-devicons' -- or use 'echasnovski/mini.icons'
  use 'HakonHarnes/img-clip.nvim'
  -- use 'zbirenbaum/copilot.lua'

  -- Main plugin: avante.nvim
  use {
      'yetone/avante.nvim',
      branch = 'main',
      run = 'make', -- Build from source
      config = function()
          require('avante').setup({
              provider = "openai",
              cursor_applying_provider = "groq",
              openai = {
                  model = "gpt-4o-mini",
              },
              behaviour = {
                  enable_cursor_planning_mode = true
              },
              vendors = {
                  groq = {
                      __inherited_from = 'openai',
                      api_key_name = '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',
                      endpoint = 'https://api.groq.com/openai/v1/',
                      model = 'llama-3.3-70b-versatile',
                      max_completion_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
                  },
              },
          })
      end
  }

  end)
