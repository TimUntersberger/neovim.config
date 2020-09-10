AutocommandCallbacks = {}

local M = {}

function M.autocmd(args)
    local events = args[1]
    local filetypes = args[2]
    local rhs = args[3]

    if type(rhs) == "function" then
        table.insert(AutocommandCallbacks, rhs)
        rhs = string.format("lua AutocommandCallbacks[%d]()", #AutocommandCallbacks)
    end

    vim.cmd(string.format(
        "autocmd! %s %s %s",
        table.concat(events, ","),
        table.concat(filetypes, ","),
        rhs
    ))
end

function M.prelude()
    autocmd = M.autocmd
end

return M
