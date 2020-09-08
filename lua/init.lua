-- This makes it possible to use pack functions
vim.cmd [[packloadall]]

if irequire ~= nil then
    irequire('util')
else
    require('util')
end
irequire('plugins')

let [[mapleader=" "]]

set [[nu]]
set [[rnu]]
set [[noswapfile]]
set [[expandtab]]
set [[tabstop=2]]
set [[splitright]]
set [[splitbelow]]
set [[softtabstop=2]]
set [[shiftwidth=2]]
set [[t_Co=256]]
set [[termguicolors]]
set [[nowrap]]
set [[incsearch]]
set [[inccommand=nosplit]]
set [[nohlsearch]]
set [[smartcase]]
set [[hidden]]
set [[mouse=a]]

vim.cmd [[filetype plugin on]]
vim.cmd [[syntax on]]

colorscheme [[gruvbox]]

nmap = irequire('lib.mapping').nmap
imap = irequire('lib.mapping').imap
autocmd = irequire('lib.autocommand').autocmd

nmap { '<F5>', [[<cmd>source $MYVIMRC<CR>]] }

if vim.fn.has('win32') then
    vim.cmd [[vnoremap <c-s-c> "*y]]
   -- irequire('config.win32')
end

nmap { '<leader>g', [[<cmd>lua require('neogit.status').create()<cr>]] }

irequire('config.lsp')
-- irequire('config.treesitter')
irequire('config.telescope')
irequire('config.packer')
irequire('config.completion-nvim')
irequire('config.session')
