MAP = function(mode, lhs, rhs, opts)
    local opts = vim.tbl_extend("force", {
        noremap = true
    }, opts or {})
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

AUCMD = function(event, file_pattern, code)
    vim.cmd(string.format([[
        autocmd %s %s %s
    ]], event, file_pattern, code))
end

I = function(...)
    print(vim.inspect(...))
end

function match(subject)
    return function(tbl)
        local default = tbl[1]

        for key, val in pairs(tbl) do
            if key == subject then
                return val
            end
        end
        
        return default
    end
end

local SHELL = match(jit.os) {
    'pwsh',
    OSX = 'zsh',
    UNIX = 'bash'
}

require 'config.packer'
require 'config.options'

-- OS Register copy/paste
MAP('n', '<c-s-v>', '"*p')
MAP('v', '<c-s-c>', '"*y')

-- Easy swapping between tabpages
MAP('n', '<c-1>', ':tabnext 1<cr>')
MAP('n', '<c-2>', ':tabnext 2<cr>')
MAP('n', '<c-3>', ':tabnext 3<cr>')
MAP('n', '<c-4>', ':tabnext 4<cr>')
MAP('n', '<c-5>', ':tabnext 5<cr>')
MAP('n', '<c-6>', ':tabnext 6<cr>')
MAP('n', '<c-7>', ':tabnext 7<cr>')
MAP('n', '<c-8>', ':tabnext 8<cr>')
MAP('n', '<c-9>', ':tabnext 9<cr>')
MAP('n', '<c-0>', ':tabnext 10<cr>')

-- Quick way to create a terminal in various locations
MAP('n', '<c-s>v', string.format([[<cmd>vsplit <bar> e term://%s <cr>]], SHELL))
MAP('n', '<c-s>s', string.format([[<cmd>split <bar> e term://%s <cr>]], SHELL))
MAP('n', '<c-s>t', string.format([[<cmd> tabnew term://%s <cr>]], SHELL))

-- Easy way to go back to vim inside a terminal
MAP('t', '<Esc>', '<C-\\><C-n>')

-- Remove line numbers of the buffer, when opening a terminal 
-- and also add a mapping for quickly closing the terminal
AUCMD('TermOpen', '*', 'set nonu | set nornu | nnoremap <buffer> <c-w>q :bw!<cr>')
