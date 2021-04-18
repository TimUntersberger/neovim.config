-- This makes it possible to use pack functions
vim.cmd [[packloadall]]

require('util').prelude()
require('lib.mapping').prelude()
require('lib.autocommand').prelude()
require('lib.command').prelude()
require('plugins')

vim.g.mapleader = " "
vim.o.ff = "unix"
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

vim.cmd [[set fillchars+=vert:\ ]]

local configurations = {
  "terminals",
  "webdevicons",
  "buffers",
  "lua",
  "neofs",
  "lsp",
  "telescope",
  "packer",
  "neogit",
  "completion-nvim",
  "session",
  "statusline",
  "treesitter",
  "lspsaga"
}

for _, name in ipairs(configurations) do
  local _, err = pcall(function()
    require('config.' .. name)
  end)

  if err then
    err = string.gsub(table.concat(vim.split(err, "\n"), "\n\n"), "\t", "  ")
    print("Loading " .. name .. " config failed. \n  Error: " .. err)
  end
end

-- has to be below the configurations, because the webdevicons configuration has to be run before changing the colorscheme
vim.cmd [[colorscheme dracula]]
