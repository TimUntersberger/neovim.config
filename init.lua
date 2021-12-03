MAP = function(mode, lhs, rhs, opts)
    local opts = vim.tbl_extend("force", {
        noremap = true
    }, opts or {})
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

require 'config.packer'
require 'config.options'
