return require('packer').startup(function()
    use 'morhetz/gruvbox'
    use 'joshdick/onedark.vim'
    use 'dracula/vim'
    -- use 'sheerun/vim-polyglot'

    use 'tpope/vim-commentary'

    use '~/Desktop/workspace/projects/neogit'
    use '~/Desktop/workspace/projects/neofs'
    use '~/Desktop/workspace/projects/nog.vim'

    use 'wbthomason/packer.nvim'

    -- use 'windwp/nvim-autopairs'
    use 'glepnir/lspsaga.nvim'

    use 'kyazdani42/nvim-web-devicons'

    use 'neovim/nvim-lspconfig'

    -- use 'hrsh7th/nvim-compe'

    use 'nvim-treesitter/nvim-treesitter'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use 'nvim-lua/lsp_extensions.nvim'
    use 'nvim-lua/telescope.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/completion-nvim'
    use 'steelsojka/completion-buffers'
end)
