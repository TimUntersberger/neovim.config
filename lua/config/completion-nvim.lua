local c = require('completion')

vim.o.completeopt = "menuone,noselect,noinsert"
vim.o.shortmess = vim.o.shortmess .. "c"
vim.g.completion_enable_snippet = ''
vim.g.completion_enable_fuzzy_match = 1

imap { "<c-n>", function()
  c.triggerCompletion()
end}

autocmd {
  { "BufEnter" },
  { "*" },
  function()
    require('completion').on_attach()
  end
}
