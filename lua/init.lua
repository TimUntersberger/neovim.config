-- This makes it possible to use pack functions
vim.cmd [[packloadall]]

if irequire ~= nil then
    irequire('util')
else
    require('util')
end
irequire('plugins')

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

nmap = irequire('lib.mapping').nmap
imap = irequire('lib.mapping').imap
vmap = irequire('lib.mapping').vmap
tmap = irequire('lib.mapping').tmap
autocmd = irequire('lib.autocommand').autocmd

nmap { '<F5>', [[<cmd>source $MYVIMRC<CR>]] }
nmap { '<leader>g', [[<cmd>lua require('neogit.status').create()<cr>]] }
nmap { '<c-e>w', [[<cmd>e ~\Desktop\workspace<cr>]] }
nmap { '<c-s>v', [[<cmd>vsplit <bar> e term://powershell <cr>]]}
nmap { '<c-s>s', [[<cmd>split <bar> e term://powershell <cr>]]}
tmap { '<Esc>', '<C-\\><C-n>' }

autocmd {
    { 'TermOpen' },
    { '*' },
    function()
        vim.wo.number = false
        vim.wo.relativenumber = false
    end
}

irequire('config.lsp')
-- irequire('config.treesitter')
irequire('config.telescope')
irequire('config.packer')
irequire('config.completion-nvim')
irequire('config.session')
