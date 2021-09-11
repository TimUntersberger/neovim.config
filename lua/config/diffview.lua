local diffview = require'diffview'

diffview.setup {
  diff_binaries = false,    -- Show diffs for binaries
  use_icons = true,        -- Requires nvim-web-devicons
  file_panel = {
    width = 35,
  }
}
