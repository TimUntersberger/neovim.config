CommandCallbacks = {}

local M = {}

function M.command(args)
    local nargs = args.nargs or 0
    local name = args[1]
    local rhs = args[2]

    if type(rhs) == "function" then
        table.insert(CommandCallbacks, rhs)
        rhs = string.format("lua CommandCallbacks[%d](%s)", #CommandCallbacks, nargs == 0 and "" or "<f-args>")
    end

    vim.cmd(string.format("command! -nargs=%s %s %s", nargs, name, rhs))
end

function M.prelude()
    for key, val in pairs(M) do
        _G[key] = val
    end
end

return M
