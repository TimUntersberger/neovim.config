local M = {}

function M.setup(plugins)
  return require('packer').startup(function()
    for _, x in ipairs(plugins) do
      use(x)
    end
  end)
end

return M
