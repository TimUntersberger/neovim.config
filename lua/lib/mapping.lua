MappingCallbacks = {}

local M = {}

function M.map(mode, args)
    local lhs = args[1]
    local rhs = args[2]

    if type(rhs) == "function" then
        table.insert(MappingCallbacks, rhs)
        rhs = string.format("<cmd>lua MappingCallbacks[%d]()<cr>", #MappingCallbacks)
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, {
        noremap = args.noremap or true,
        silent = args.silent or true
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
