require('bootstrap')

require('plugins').setup {
  'morhetz/gruvbox',
  'joshdick/onedark.vim',
  'dracula/vim',
  'nvim-lualine/lualine.nvim',
  'tpope/vim-commentary',
  '~/Desktop/workspace/projects/neogit',
  '~/Desktop/workspace/projects/neofs',
  '~/Desktop/workspace/projects/neospaces',
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

vim.g.mapleader = " "

command { "Prettier", "!prettier -w %" }
nmap { "<c-w>f", ":tab split<CR>" }

command { "BootstrapProject", function(name)
  local util = require 'util'
  local workspace_path = vim.fn.expand("~/Desktop/workspace/projects")
  local full_path = util.join_path(workspace_path, name)
  vim.loop.fs_mkdir(full_path, 438)
end, nargs = 1 }

TEOVIM = {
  src = [[
    const appEle = document.getElementById("app")
    appEle.innerText = "Hello World from neovim lua config!"
  ]]
}

-- has to be before loading the configs

--require('config').setup_only { "lsp", "lua", "telescope", "neofs", "neogit" }
require('config').setup { "completion-nvim", "statusline", "netrw", "lspsaga", "compe" }
require('options') -- has to be below the configurations, because the webdevicons configuration has to be run before changing the colorscheme
