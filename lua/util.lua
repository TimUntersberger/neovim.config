local M = {}

local exclude = { "bit", "_G", "vim.*" }

function M.invalidate(path, recursive)
    if recursive then
        for key, value in pairs(package.loaded) do
          if value then
            local skip = false
            for _, x in ipairs(exclude) do
              if vim.fn.match(key, x) ~= -1 then
                skip = true
                break
              end
            end
            if not skip and vim.fn.match(key, path) ~= -1 then
                package.loaded[key] = nil
            end
          end
        end
    else
        package.loaded[path] = nil
    end
end

function M.inspect(...)
  local args = {...}
  -- need to wrap this in a vim.schedule else you will encounter a segment fault when using the function inside a coroutine
  vim.schedule(function()
    for _, x in ipairs(args) do
      print(vim.inspect(x))
    end
  end)
end

function M.time(name, f)
  local before = os.clock()
  local res = f()
  print(name .. " took " .. (os.clock() - before) * 1000 .. "ms")
  return res
end

function M.dbg(x)
  if type(x) == "function" then
    return function(...)
      local res = x(...)
      inspect(res)
      return res
    end
  end

  inspect(x)
  return x
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
    if jit.os == "windows" then
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
