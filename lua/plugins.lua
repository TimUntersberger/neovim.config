return require('packer').startup(function()
    use 'morhetz/gruvbox'
    use 'sheerun/vim-polyglot'

    use 'tpope/vim-commentary'

    use '~/Desktop/workspace/projects/neogit'

    use 'wbthomason/packer.nvim'

    use 'voldikss/vim-floaterm'

    use 'kyazdani42/nvim-web-devicons'

    use 'neovim/nvim-lspconfig'

    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-lua/telescope.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/diagnostic-nvim'
end)
