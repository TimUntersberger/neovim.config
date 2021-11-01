local lsp_installer = require "nvim-lsp-installer"
local lsp_installer_servers = require 'nvim-lsp-installer.servers'

local ensure_installed = {
  "tsserver",
  "vimls",
  "rust_analyzer",
  "vuels",
  "html",
  "cssls",
  "dockerls",
  "jsonls"
}

for _, name in ipairs(ensure_installed) do
  local ok, server = lsp_installer_servers.get_server(name)
  if ok then
    if not server:is_installed() then
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
    local opts = {}

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)
