MappingCallbacks = {}

local M = {}

function M.map(mode, args)
    local lhs = args[1]
    local rhs = args[2]

    if not rhs or not lhs then
        return
    end

    if args.noremap == nil then
        args.noremap = true
    end

    if args.buffer == nil then
        args.buffer = false
    end

    if args.silent == nil then
        args.silent = true
    end

    if type(rhs) == "function" then
        table.insert(MappingCallbacks, rhs)
        rhs = string.format("<cmd>lua MappingCallbacks[%d]()<cr>", #MappingCallbacks)
    end

    local f = vim.api.nvim_set_keymap

    if args.buffer then
        f = function(...) vim.api.nvim_buf_set_keymap(0, ...) end
    end

    f(mode, lhs, rhs, {
        noremap = args.noremap,
        silent = args.silent
    })
end

function M.nmap(args)
    M.map('n', args)
end

function M.vmap(args)
    M.map('v', args)
end

function M.imap(args)
    M.map('i', args)
end

function M.tmap(args)
    M.map('t', args)
end

function M.prelude()
    for key, val in pairs(M) do
        if key ~= "map" then
            _G[key] = val
        end
    end
end

return M
