local ts = require('nvim-treesitter.configs')

ts.setup {
  ensure_installed = { 'lua', 'rust', 'toml', 'vue', 'yaml', 'javascript', 'css', 'html', 'json' },
  highlight = {
    enable = true
  },
  context_commentstring = {
    enable = true,
    config = {
      rust = "// %s"
    }
  }
}

ts.init()
