local ts = require('nvim-treesitter.configs')

ts.setup {
  ensure_installed = { 'lua', 'rust', 'toml', 'vue', 'yaml', 'javascript', 'css', 'html', 'json', 'typescript', 'tsx' },
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

ts.init()
