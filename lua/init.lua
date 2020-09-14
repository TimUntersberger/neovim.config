-- This makes it possible to use pack functions
vim.cmd [[packloadall]]

require('util').prelude()
require('plugins')

vim.g.mapleader = " "
vim.g.colors_name = 'gruvbox'

vim.o.nu = true
vim.o.rnu = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.t_Co = '256'
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.incsearch = true
vim.o.inccommand = 'nosplit'
vim.o.hlsearch = false
vim.o.smartcase = true
vim.o.hidden = true
vim.o.mouse = 'a'

require('lib.mapping').prelude()
require('lib.autocommand').prelude()
require('lib.command').prelude()

command {
    "LuaInvalidate",
    function(pattern) invalidate(pattern, true) end,
    nargs = 1
}

nmap { '<F2>', [[:LuaInvalidate ]], silent = false }
nmap { '<F3>', function()
    invalidate('.*', true)
    vim.cmd([[source $MYVIMRC]])
    print("reloaded")
end}
nmap { '<leader>g', require('neogit.status').create }
nmap { '<c-e>w', [[<cmd>e ~\Desktop\workspace<cr>]] }
nmap { '<c-s>v', [[<cmd>vsplit <bar> e term://powershell <cr>]]}
nmap { '<c-s>s', [[<cmd>split <bar> e term://powershell <cr>]]}
tmap { '<Esc>', '<C-\\><C-n>' }

autocmd {
    { 'TermOpen' },
    { '*' },
    function()
        vim.wo.nu = false
        vim.wo.rnu = false
    end
}

require('config.lsp')
require('config.telescope')
require('config.packer')
require('config.completion-nvim')
require('config.session')
require('config.statusline')
-- require('config.treesitter')
