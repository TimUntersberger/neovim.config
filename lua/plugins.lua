return require('packer').startup(function()
    use 'morhetz/gruvbox'
    use 'sheerun/vim-polyglot'

    use 'wbthomason/packer.nvim'

    use '~/Desktop/workspace/projects/neogit'

    use 'neovim/nvim-lspconfig'
    -- use 'nvim-treesitter/nvim-treesitter'

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'TimUntersberger/telescope.nvim'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/diagnostic-nvim'
end)
