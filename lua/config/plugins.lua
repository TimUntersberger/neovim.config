return {
    'wbthomason/packer.nvim',
    'tomasiser/vim-code-dark',
    {
        'TimUntersberger/neogit',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            local neogit = require 'neogit'

            neogit.setup {
                disable_hint = true,
                disable_commit_confirmation = true,
                disable_builtin_notifications = true,
                disable_insert_on_commit = false
            }

            MAP('n', '<space>g', ':Neogit<cr>')
        end
    },
    {
        'TimUntersberger/neofs',
        config = function()
            local neofs = require 'neofs'

            neofs.setup {
                mappings = {
                    ["<c-e>w"] = function()
                        fm.path = vim.fn.expand("~/Desktop/workspace")
                        fm.refresh()
                    end
                }
            }

            MAP('n', '<c-n>', ':lua require"neofs".open()<cr>')
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            local telescope = require 'telescope'

            telescope.setup {}

            MAP('n', '<c-p>', ':Telescope find_files<cr>')
            MAP('n', '<c-f>', ':Telescope live_grep<cr>')
        end
    }
}
