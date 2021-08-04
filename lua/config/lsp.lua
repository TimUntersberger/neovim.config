local lsp = require('lspconfig')
local configs = {}

local servers = {
  "tsserver",
  "vimls",
  "rust_analyzer",
  "vuels",
  "html",
  "cssls",
  "dockerls",
  "jsonls"
}

vim.lsp.set_log_level("debug")

for _, server in pairs(servers) do
  local config = configs[server] or {}
  lsp[server].setup(config)
end

nmap { 'gD', [[<cmd>lua vim.lsp.buf.declaration()<CR>]] }
nmap { 'gd', [[<cmd>lua vim.lsp.buf.definition()<CR>]] }
nmap { 'gi', [[<cmd>lua vim.lsp.buf.implementation()<CR>]] }
nmap { 'gt', [[<cmd>lua vim.lsp.buf.type_definition()<CR>]] }
nmap { '<c-=>', [[<cmd>lua vim.lsp.buf.formatting()<CR>]] }

-- LspSaga mappings
nmap { 'gh', [[<cmd>Lspsaga hover_doc<CR>]] }
nmap { '<leader>ld', [[<cmd>Lspsaga show_line_diagnostics<CR>]] }
nmap { 'gR', [[<cmd>Lspsaga rename<CR>]] }
nmap { ']d', [[<cmd>Lspsaga diagnostic_jump_next<CR>]] }
nmap { '[d', [[<cmd>Lspsaga diagnostic_jump_prev<CR>]] }
nmap { '<c-.>', [[<cmd>Lspsaga code_action<CR>]] }
vmap { '<c-.>', [[<cmd><C-U>Lspsaga range_code_action<CR>]] }

-- autocmd {
--   { "BufEnter", "BufWinEnter", "TabEnter" },
--   { "*.rs" },
--   function()
--     require('lsp_extensions').inlay_hints{}
--   end
-- }
