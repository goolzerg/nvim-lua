local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}
)

-- Install your plugins here
return packer.startup(function(use)
  -- Plugins list
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins
	use 'lukas-reineke/indent-blankline.nvim'
  use 'williamboman/nvim-lsp-installer'
  use 'SmiteshP/nvim-navic'
  use 'tpope/vim-surround'
  use 'sainnhe/everforest'
  use 'qpkorr/vim-bufkill'
  use "rebelot/kanagawa.nvim"
  use 'karb94/neoscroll.nvim'
  use 'kdheepak/lazygit.nvim'
  use 'is0n/fm-nvim'
  use 'folke/tokyonight.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'junegunn/seoul256.vim'
  use 'akinsho/toggleterm.nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lualine/lualine.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'sindrets/diffview.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
	use 'ThePrimeagen/harpoon'
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
				require('telescope').load_extension('projects')
      }
    end
  }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }

  -- Autocomplete plugins set
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'


  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      --require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }


  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
