local lsp = require('lspconfig')
local servers = {"tsserver", "vimls", "jsonls", "rust_analyzer"}

for _, server in pairs(servers) do
  lsp[server].setup{on_attach=require'completion'.on_attach()}
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

nmap { '<leader>ld', function() vim.lsp.diagnostic.show_line_diagnostics() end }
nmap { 'gR', [[<cmd>lua vim.lsp.buf.rename()<CR>]] }
nmap { ']d', function() vim.lsp.diagnostic.goto_next { wrap = false } end }
nmap { '[d', function() vim.lsp.diagnostic.goto_prev { wrap = false } end }
