local M = {}

local function _setup(filter)
  local configurations = require 'plenary.scandir'.scan_dir(vim.fn.stdpath('config') .. '/lua/config')

  for _, path in ipairs(configurations) do
    local name = path:match("./lua/config\\?/?(.*).lua")
    if filter(name) then
      local _, err = pcall(function()
        require('config.' .. name)
      end)

      if err then
        err = string.gsub(table.concat(vim.split(err, "\n"), "\n\n"), "\t", "  ")
        print("Loading " .. name .. " config failed. \n  Error: " .. err)
      end
    end
  end
end

function M.setup(disabled_configs)
  _setup(function(name)
    return not vim.tbl_contains(disabled_configs, name)
  end)
end

function M.setup_only(configs)
  _setup(function(name)
    return vim.tbl_contains(configs, name)
  end)
end

return M
