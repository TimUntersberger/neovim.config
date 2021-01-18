local ts = require('nvim-treesitter.configs')

ts.setup {
    ensure_installed = { 'lua', 'rust' },
    highlight = {
        enable = true
    },
}
