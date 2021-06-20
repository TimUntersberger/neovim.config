local M = {}

function M.setup(disabled_configs)
  local configurations = require 'plenary.scandir'.scan_dir(vim.fn.stdpath('config') .. '/lua/config')

  for _, path in ipairs(configurations) do
    local name = path:match("./lua/config\\?/?(.*).lua")
    if not vim.tbl_contains(disabled_configs, name) then
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

return M
