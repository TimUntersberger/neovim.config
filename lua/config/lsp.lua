nmap { 'gD', vim.lsp.buf.declaration }
nmap { '<c-=>', vim.lsp.buf.formatting }
nmap { 'gh', vim.lsp.buf.hover }
nmap { '<leader>ld', vim.lsp.util.show }
nmap { 'gR', vim.lsp.buf.rename }
nmap { ']d', vim.lsp.diagnostic.goto_next }
nmap { '[d', vim.lsp.diagnostic.goto_prev }

local telescope_builtin = require 'telescope.builtin'

nmap { 'gt', telescope_builtin.lsp_type_definitions }
nmap { 'gd', telescope_builtin.lsp_definitions }
nmap { 'gi', telescope_builtin.lsp_implementations }
nmap { '<c-.>', telescope_builtin.lsp_code_actions }
nmap { 'gr', telescope_builtin.lsp_references }
nmap { '<c-l>ds', telescope_builtin.lsp_document_symbols }
nmap { '<c-l>ws', telescope_builtin.lsp_workspace_symbols }

autocmd {
  { "BufEnter", "BufWinEnter", "TabEnter" },
  { "*.rs" },
  function()
    require('lsp_extensions').inlay_hints{}
  end
}
