local M = {}

M.current_file = "%f"
M.align_right = "%="
M.clear_highlight = '%*'

M.padding = function(len)
    return string.rep(' ', len)
end

M.highlight = function(name)
    return '%#' .. name .. '#'
end

M.current_branch = function()
    return vim.fn.systemlist([[git rev-parse --abbrev-ref HEAD]])[1]
end

M.current_file_icon = function()
    return vim.o.filetype
end

M.current_mode = function(opts)
    local opts = vim.tbl_extend("keep", opts or {}, {
        highlight = true
    })
    local modes = {
      n = { "NORMAL", "DiffChange" },
      v = { "VISUAL", "DiffChange" },
      i = { "INSERT", "DiffAdd" },
      c = { "COMMAND", "DiffText" }
    }

    local mode = modes[vim.api.nvim_get_mode().mode] or modes.n

    return opts.highlight and M.colored(mode[2], mode[1]) or mode[1]
end

function M.colored(highlight, comp)
    return {
        M.highlight(highlight),
        comp, 
        M.clear_highlight,
    }
end

return M
