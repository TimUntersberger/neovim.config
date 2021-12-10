local neogit = require 'neogit'

neogit.setup {
  disable_signs = true,
  disable_hint = true,
  disable_builtin_notifications = true,
  integrations = {
    diffview = true
  }
}

command {
  'NeogitToggleAutoRefresh',
  function()
    local config = require'neogit'.get_config()
    config.auto_refresh = not config.auto_refresh
    vim.notify("Neogit: auto refresh is now " .. (config.auto_refresh and "enabled" or "disabled"))
  end
}

nmap { '<leader>g', function()
  require'neogit'.status.create()
end}
