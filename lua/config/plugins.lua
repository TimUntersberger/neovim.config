return {
    -- Package manager
    'wbthomason/packer.nvim',
    -- VsCode default dark theme
    'tomasiser/vim-code-dark',
    -- Nice looking icons (requires nerdfont)
    {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require'nvim-web-devicons'.setup{}

            -- Setup devicons again, when the colorscheme changes
            AUCMD('ColorScheme', '*', ':lua require"nvim-web-devicons".setup{}')
        end
    },
    -- Replaces the default vim.notify with a nice looking notification system
    {
        'rcarriga/nvim-notify',
        config = function()
            --vim.notify = require('notify')
        end
    },
    -- Git UI
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
    -- Convenient filesystem UI
    {
        'TimUntersberger/neofs',
        config = function()
            local neofs = require 'neofs'

            neofs.setup {
                mappings = {
                    ["<c-e>w"] = function(fm)
                        fm.path = vim.fn.expand("~/Desktop/workspace")
                        fm.refresh()
                    end
                }
            }

            MAP('n', '<c-n>', ':lua require"neofs".open()<cr>')
        end
    },
    -- FuzzyFinder/LiveGrep/...
    {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            local telescope = require 'telescope'

            telescope.setup {}

            MAP('n', '<c-p>', ':Telescope find_files<cr>')
            MAP('n', '<c-f>', ':Telescope live_grep<cr>')
        end
    },
    -- AutoComplete
    {
        'hrsh7th/nvim-cmp',
        requires = {
            -- Issues and contributors
            'petertriho/cmp-git',
            -- LSP results
            'hrsh7th/cmp-nvim-lsp',
            -- Filesystem
            'hrsh7th/cmp-path',
            -- Buffer local text
            'hrsh7th/cmp-buffer'
        },
        config = function()
            local cmp = require 'cmp'

            cmp.setup {
                mapping = {
                    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
                    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                    ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
                    ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'cmp_git' },
                }, {
                    { name = 'buffer' },
                })
            }

            require'cmp_git'.setup({
                -- defaults
                filetypes = { 'gitcommit' },
                github = {
                    issues = {
                        filter = 'all', -- assigned, created, mentioned, subscribed, all, repos
                        limit = 100,
                        state = 'open', -- open, closed, all
                    },
                    mentions = {
                        limit = 100,
                    },
                },
                gitlab = {
                    issues = {
                        limit = 100,
                        state = 'opened', -- opened, closed, all
                    },
                    mentions = {
                        limit = 100,
                    },
                    merge_requests = {
                        limit = 100,
                        state = 'opened', -- opened, closed, locked, merged
                    },
                },
            })
        end
    },
    -- Cross platform LSP Server installer
    {
        'williamboman/nvim-lsp-installer',
        requires = {
            'neovim/nvim-lspconfig'
        },
        config = function()
            local servers = {
                'tsserver',
                'vimls',
                'rust_analyzer',
                'vuels',
                'html',
                'cssls',
                'dockerls',
                'jsonls'
            }

            local lsp_installer = require 'nvim-lsp-installer'
            local lsp_installer_servers = require 'nvim-lsp-installer.servers'

            for _, name in ipairs(servers) do
                local ok, server = lsp_installer_servers.get_server(name)
                if ok then
                    if not server:is_installed() then
                        server:install()
                    end
                end
            end

            lsp_installer.on_server_ready(function(server)
                local opts = {}

                server:setup(opts)
                vim.cmd [[ do User LspAttachBuffers ]]
            end)
        end
    },
    -- Nice looking tabbar
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require'lualine'.setup {
                options = {
                    theme = 'codedark'
                }
            }
        end
    },
    -- Treesitter utility
    {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            -- Automatically sets the comment string based on the context
            'JoosepAlviste/nvim-ts-context-commentstring'
        },
        config = function()
            local grammars = {
                'lua',
                'rust',
                'toml',
                'vue',
                'yaml',
                'javascript',
                'css',
                'html',
                'json',
                'typescript',
                'tsx'
            }

            local config = require 'nvim-treesitter.configs'

            config.setup {
              ensure_installed = grammars,
              highlight = {
                enable = true
              },
              context_commentstring = {
                enable = true,
                config = {
                  lua = "-- %s",
                  rust = "// %s"
                }
              }
            }

            config.init()
        end
    },
    -- Easy way to comment/uncomment
    {
        'terrortylor/nvim-comment',
        requires = {
            -- Sets the commentstring based on the cursor position using treesitter
            'JoosepAlviste/nvim-ts-context-commentstring'
        },
        config = function()
            require'nvim_comment'.setup {
                create_mappings = true
            }
        end
    }
}
