set [[completeopt=menuone,noselect,noinsert]]
set [[shortmess+=c]]
let [[g:completion_enable_snippet = '']]
let [[g:completion_enable_fuzzy_match = 1]]

imap { "<c-n>", "<cmd>call completion#trigger_completion()<CR>"}