local sl = require('lib.statusline')
local neogit = require('neogit')
local c = sl.components

sl.reset()

sl.setup {
  c.current_file,
  c.padding(1),
  function()
    local branch = neogit.status.get_status().branch

    if not branch or branch == '' then
      return ''
    end

    return {
      '',
      c.padding(1),
      branch,
    }
  end
} 
