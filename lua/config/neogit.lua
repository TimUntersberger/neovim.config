local neogit = require 'neogit'
local a = require 'plenary.async_lib'
local Path = require 'plenary.path'
local void, await, async, scheduler = a.void, a.await, a.async, a.scheduler

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
    local config = neogit.get_config()
    config.auto_refresh = not config.auto_refresh
    vim.notify("Neogit: auto refresh is now " .. (config.auto_refresh and "enabled" or "disabled"))
  end
}

-- Cd from repo root
command { 
  'Ncd', 
  nargs = 1,
  void(async(function(path)
    local repo_path = Path:new(await(git_root()))
    local new_cd = repo_path:joinpath(path).filename
    await(scheduler())
    vim.cmd("cd " .. new_cd)
  end))
}

nmap { '<leader>g', neogit.status.create }
