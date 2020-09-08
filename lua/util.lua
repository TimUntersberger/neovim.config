function invalidate(path)
    package.loaded[path] = nil
end

function irequire(path)
    invalidate(path)
    return require(path)
end

function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then
        io.close(f)
        return true
    else
        return false
    end
end

function os_seperator()
    if vim.fn.has("win32") then
        return "\\"
    else
        return "/"
    end
end

function let(x)
    vim.cmd(string.format("let %s", x))
end

function set(x)
    vim.cmd(string.format("set %s", x))
end

function colorscheme(val)
    vim.cmd(string.format("colorscheme %s", val))
end

function command(args)
    local nargs = args.nargs or 0
    local name = args[1]
    local rhs = args[2]
    vim.cmd(string.format("command! -nargs=%d %s %s", nargs, name, rhs))
end

