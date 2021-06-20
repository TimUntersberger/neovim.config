-- This makes it possible to use pack functions
vim.cmd [[packloadall]]

-- bootstrap packer.nvim if not already installed
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command 'packadd packer.nvim'
end

require('util').prelude()
require('lib.mapping').prelude()
require('lib.autocommand').prelude()
require('lib.command').prelude()

