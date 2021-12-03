local packer_install_path = vim.fn.stdpath('data') ..'/site/pack/packer/start/packer.nvim'
local packer_installed = vim.fn.empty(vim.fn.glob(packer_install_path)) > 0

if not packer_installed then
  packer_bootstrap = vim.fn.system {
    'git', 
    'clone', 
    '--depth', 
    '1', 
    'https://github.com/wbthomason/packer.nvim', 
    packer_install_path
  }
end

return require('packer').startup {
  require 'config.plugins',
  config = {
      ensure_dependencies = true
  }
}
