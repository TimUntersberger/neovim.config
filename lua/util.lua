local M = {}

function M.invalidate(path, recursive)
    if recursive then
        for key, value in pairs(package.loaded) do
            if key ~= "_G" and value and vim.fn.match(key, path) ~= -1 then
                package.loaded[key] = nil
            end
        end
    else
        package.loaded[path] = nil
    end
end

function M.file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then
        io.close(f)
        return true
    else
        return false
    end
end

function M.os_seperator()
    if vim.fn.has("win32") then
        return "\\"
    else
        return "/"
    end
end

function M.map(t, f)
    return vim.tbl_map(f, t)
end

function M.prelude()
    local dont = { "prelude" }

    for key, value in pairs(M) do
        if not vim.tbl_contains(dont, key) then
            _G[key] = value
        end
    end
end

return M
