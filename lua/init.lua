require('bootstrap')

require('plugins').setup {
  'morhetz/gruvbox',
  'joshdick/onedark.vim',
  'dracula/vim',
  'nvim-lualine/lualine.nvim',
  'tpope/vim-commentary',
  '~/Desktop/workspace/projects/neogit',
  '~/Desktop/workspace/projects/neofs',
  'sindrets/diffview.nvim',
  'wbthomason/packer.nvim',
  'vhyrro/neorg',
  'glepnir/lspsaga.nvim',
  'kyazdani42/nvim-web-devicons',
  'neovim/nvim-lspconfig',
  'rcarriga/nvim-notify',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/playground',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'nvim-lua/lsp_extensions.nvim',
  'nvim-lua/telescope.nvim',
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'pwntester/octo.nvim',
  'milisims/nvim-luaref',
  'folke/trouble.nvim',
  'williamboman/nvim-lsp-installer',
  'hrsh7th/nvim-cmp',
  'petertriho/cmp-git',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline'
  -- 'hrsh7th/nvim-compe',
  -- 'nvim-lua/completion-nvim',
  -- 'steelsojka/completion-buffers',
}

command { "Prettier", "!prettier -w %" }
command { "ClearLineVirtTxt", "lua vim.api.nvim_buf_set_virtual_text(0, -1, vim.api.nvim_win_get_cursor(0)[1], {}, {})" }
nmap { "<c-w>f", ":tab split<CR>" }

TEOVIM = {
  src = [[
    const appEle = document.getElementById("app")
    appEle.innerText = "Hello World from neovim lua config!"
  ]]
}

-- has to be before loading the configs
vim.g.mapleader = " "

--require('config').setup_only { "lsp", "lua", "telescope", "neofs", "neogit" }
require('config').setup { "completion-nvim", "statusline", "netrw", "lspsaga", "compe" }
require('options') -- has to be below the configurations, because the webdevicons configuration has to be run before changing the colorscheme
