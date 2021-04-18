local neogit = require 'neogit'
local a = require 'plenary.async_lib'
local Path = require 'plenary.path'
local void, await, async, scheduler = a.void, a.await, a.async, a.scheduler

neogit.setup {
  disable_signs = true
}

local git_root = require('neogit.lib.git.cli').git_root

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
