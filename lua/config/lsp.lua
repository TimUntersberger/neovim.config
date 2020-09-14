local lsp = require('nvim_lsp')
local servers = {"tsserver", "vimls", "jsonls", "rust_analyzer"}

local on_attach_vim = function()
  require'completion'.on_attach()
  require'diagnostic'.on_attach()
end

for _, server in pairs(servers) do
  lsp[server].setup{on_attach=on_attach_vim}
end

nmap { 'gD', [[<cmd>lua vim.lsp.buf.declaration()<CR>]] }
nmap { 'gd', [[<cmd>lua vim.lsp.buf.definition()<CR>]] }
nmap { 'gh', [[<cmd>lua vim.lsp.buf.hover()<CR>]] }
nmap { 'gi', [[<cmd>lua vim.lsp.buf.implementation()<CR>]] }
nmap { 'gt', [[<cmd>lua vim.lsp.buf.type_definition()<CR>]] }

command {
  'LspRestart',
  function()
    vim.lsp.stop_client(vim.lsp.get_active_clients())
  end
}

-- TODO: Change to something using telescope
nmap { '<leader>la', [[<cmd>lua vim.lsp.buf.code_action()<CR>]] }
nmap { '<leader>ld', [[<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>]] }
nmap { '<leader>lr', [[<cmd>lua vim.lsp.buf.rename()<CR>]] }
