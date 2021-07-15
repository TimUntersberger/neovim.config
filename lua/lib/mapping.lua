local M = {}
M.callbacks = {}

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

    local id

    if type(rhs) == "function" then
        table.insert(M.callbacks, rhs)
        id = #M.callbacks
        rhs = string.format("<cmd>lua require('lib.mapping').callbacks[%d]()<cr>", id)
    end

    local f = vim.api.nvim_set_keymap

    if args.buffer then
        f = function(...) vim.api.nvim_buf_set_keymap(0, ...) end
    end

    f(mode, lhs, rhs, {
        noremap = args.noremap,
        silent = args.silent
    })

    return id
end

function M.nmap(args)
    return M.map('n', args)
end

function M.vmap(args)
    return M.map('v', args)
end

function M.imap(args)
    return M.map('i', args)
end

function M.tmap(args)
    return M.map('t', args)
end

function M.prelude()
    for key, val in pairs(M) do
        if key ~= "map" then
            _G[key] = val
        end
    end
end

return M
