vim.o.ff = "unix"
vim.o.nu = true
vim.o.rnu = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.expandtab = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.incsearch = true
vim.o.inccommand = 'nosplit'
vim.o.hlsearch = false
vim.o.smartcase = true
vim.o.hidden = true
vim.o.mouse = 'a'
vim.o.showtabline = 1
vim.o.tabline = '%!luaeval("Tabline()")'

vim.cmd [[set fillchars+=vert:\ ]]
vim.cmd [[colorscheme dracula]]
