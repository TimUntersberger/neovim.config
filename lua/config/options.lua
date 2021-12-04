local tabwidth = 4

-- default tabwidth
vim.o.tabstop = tabwidth
vim.o.shiftwidth = tabwidth

-- use spaces instead of tabs
vim.o.expandtab = true

-- enable linenumbers
vim.o.number = true
vim.o.relativenumber = true

-- disable safety nets of vim that might polute the directory
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

-- not a fan of line wrapping
vim.o.wrap = false

-- Makes '/' and family basically case-insensitive
vim.o.smartcase = true

-- make the tabbar visible when more than one tabpage is open
vim.o.showtabline = 1

-- nvim-cmp recommended settings
vim.o.completeopt = 'menuone,noselect'

-- enable mouse support
vim.o.mouse = 'a'

-- change location of new splits
vim.o.splitright = true
vim.o.splitbelow = true

-- set colorscheme 
vim.cmd 'colorscheme codedark'
