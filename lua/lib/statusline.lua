local M = {}

M.__components = {}

local function component_to_text(comp)
    if type(comp) == 'string' then
        return comp
    elseif vim.tbl_islist(comp) then
        return table.concat(map(comp, component_to_text), "")
    end
    return component_to_text(comp())
end

function __Statusline()
    local res = component_to_text(M.__components)

    return res
end

function M.reset()
    vim.o.statusline = ""
end

function M.setup(components)
    M.__components = components
    vim.o.statusline = '%!luaeval("__Statusline()")'
end

M.components = require('lib.statusline.components')

return M
