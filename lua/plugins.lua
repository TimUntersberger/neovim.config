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

    use 'voldikss/vim-floaterm'

    use 'kyazdani42/nvim-web-devicons'

    use 'neovim/nvim-lspconfig'

    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'nvim-lua/telescope.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/completion-nvim'
end)
