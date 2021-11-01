local lualine = require 'lualine'
local ws = require 'config.workspaces'

lualine.setup {
  options = {
    theme = "dracula"
  },
  sections = {
    lualine_x = {'encoding', 'fileformat', 'filetype'}
  },
  tabline = {
    lualine_a = {'tabs'},
    lualine_z = {ws.get_workspace_name}
  }
}
