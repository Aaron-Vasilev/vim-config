-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('nvim-telescope/telescope-fzy-native.nvim')
  use('junegunn/fzf')
  use('junegunn/fzf.vim')
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  use ({
    'sonph/onehalf',
    rtp = 'vim',
    config = function()
               vim.cmd('colorscheme onehalflight')
             end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/nvim-treesitter-context')
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')

  -- Git
  use('tpope/vim-fugitive')
  use('lewis6991/gitsigns.nvim')
  use('theprimeagen/git-worktree.nvim')
  use('nvim-lua/popup.nvim')

  use {
    'VonHeikemen/lsp-zero.nvim',
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
      -- Snippet Collection (Optional)
      {'rafamadriz/friendly-snippets'},
    }
  }

  use ({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
               vim.cmd('colorscheme rose-pine')
             end
  })

  use('CRAG666/code_runner.nvim')
  use('m4xshen/autoclose.nvim')
  use('windwp/nvim-ts-autotag')
  use('jose-elias-alvarez/null-ls.nvim')
  use('ggandor/leap.nvim')

  -- Debugger
  use('mfussenegger/nvim-dap')
  use('rcarriga/nvim-dap-ui')
  use('nvim-neotest/nvim-nio')
  use('theHamsta/nvim-dap-virtual-text')
  use('nvim-telescope/telescope-dap.nvim')
  use('leoluz/nvim-dap-go')
  use('mxsdev/nvim-dap-vscode-js')
  use('microsoft/vscode-js-debug')

  -- Query DB
  use('tpope/vim-dadbod')
  use('kristijanhusak/vim-dadbod-ui')
  use('kristijanhusak/vim-dadbod-completion')
end)
