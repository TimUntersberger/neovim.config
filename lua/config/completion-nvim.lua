vim.o.completeopt = "menuone,noselect,noinsert"
vim.o.shortmess = vim.o.shortmess .. "c"
vim.g.completion_enable_snippet = ''
vim.g.completion_enable_fuzzy_match = 1

imap { "<c-n>", "<cmd>call completion#trigger_completion()<CR>"}
