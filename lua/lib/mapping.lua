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

function M.imap(args)
    M.map('i', args)
end

return M