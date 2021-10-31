local config = require 'nvim-treesitter.configs'
local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()

config.setup {
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

parser_config.neogit_log_view = {
  install_info = {
    url = "~/Desktop/workspace/projects/tree-sitter-neogit",
    files = {
      "src/parser.c"
    }
  },
  filetype = "NeogitLogView2"
}

config.init()
