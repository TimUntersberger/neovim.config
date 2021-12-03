-- default tabwidth
local tabwidth = 4
vim.o.tabstop = tabwidth
vim.o.shiftwidth = tabwidth

-- use spaces instead of tabs
vim.o.expandtab = true

vim.o.number = true
vim.o.relativenumber = true

vim.cmd 'colorscheme codedark'
