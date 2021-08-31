require('bootstrap')

require('plugins').setup {
  'morhetz/gruvbox',
  'joshdick/onedark.vim',
  'dracula/vim',
  'hoob3rt/lualine.nvim',
  'tpope/vim-commentary',
  '~/Desktop/workspace/projects/neogit',
  '~/Desktop/workspace/projects/neofs',
  'sindrets/diffview.nvim',
  'wbthomason/packer.nvim',
  'vhyrro/neorg',
  'glepnir/lspsaga.nvim',
  'kyazdani42/nvim-web-devicons',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-compe',
  'nvim-treesitter/nvim-treesitter',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'nvim-lua/lsp_extensions.nvim',
  'nvim-lua/telescope.nvim',
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'pwntester/octo.nvim',
  'milisims/nvim-luaref',
  -- 'nvim-lua/completion-nvim',
  -- 'steelsojka/completion-buffers',
}

command { "Prettier", "!prettier -w %" }
command { "ClearLineVirtTxt", "lua vim.api.nvim_buf_set_virtual_text(0, -1, vim.api.nvim_win_get_cursor(0)[1], {}, {})" }

-- has to be before loading the configs
vim.g.mapleader = " "

--require('config').setup_only { "lsp", "lua", "telescope", "neofs", "neogit" }
require('config').setup { "completion-nvim", "statusline", "netrw" }
require('options') -- has to be below the configurations, because the webdevicons configuration has to be run before changing the colorscheme
