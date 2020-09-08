"{{{Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/diagnostic-nvim'
Plug 'haorenW1025/completion-nvim'

Plug 'sheerun/vim-polyglot'

Plug 'mhinz/vim-startify'


" Plug 'timuntersberger/neogit'
" Plug '/mnt/c/Users/timun/Desktop/workspace/projects/neogit'
" Plug 'tpope/vim-fugitive'

Plug 'tweekmonster/startuptime.vim'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()
"}}}
"{{{ General
colorscheme nord

let mapleader=' '
set foldmethod=marker

set nu
set rnu

set noswapfile
set expandtab
set tabstop=2
set splitright
set splitbelow
set softtabstop=2
set shiftwidth=2
set t_Co=256
set termguicolors
set nowrap
set incsearch
set inccommand=nosplit
set nohlsearch
set smartcase
set hidden

nnoremap <silent> <leader>r :so %<CR>
nnoremap <leader>l :set rtp+=./<CR>
"}}}
"{{{ LSP
lua << EOF

local lsp = require'nvim_lsp'
local servers = {"tsserver", "vimls", "jsonls", "rls", "sumneko_lua"}

local on_attach_vim = function()
  require'completion'.on_attach()
  require'diagnostic'.on_attach()
end

for key, server in pairs(servers) do
  lsp[server].setup{on_attach=on_attach_vim}
end

EOF

nnoremap <silent> gD           <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd           <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh           <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi           <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr           <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gt           <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>la   <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>ld   <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent> <leader>lr   <cmd>lua vim.lsp.buf.rename()<CR>
"}}}
"{{{ startify
let g:startify_custom_header = []
let g:startify_enable_unsafe = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
"}}}
"{{{ custom make
function s:make_on_exit(channel, data, name)
  call setqflist([], "f")
  caddexpr getbufline(bufnr('Make'), 1, '$')

  if(a:data > 0)
    cwindow
  endif
endfunction

function! s:custom_make()
  cclose
  if(bufnr('Make') > 0)
    bdelete! Make
  endif
  enew
  call termopen(g:makeprg, { 'on_exit': function('s:make_on_exit') })
  file Make
endfunction

let g:makeprg=''

au FileType typescript ++once let g:makeprg='tsc'
au FileType rust ++once let g:makeprg='cargo build'
au BufEnter * let &makeprg = g:makeprg | let &g:errorformat = &l:errorformat

command! -nargs=0 CustomMake call <SID>custom_make()
command! -nargs=* SetMake let &makeprg=<q-args>

nnoremap <silent> <leader>m :CustomMake<CR>
nnoremap <leader>sm :let g:makeprg = input({ "prompt": "SetMake: ", "default": g:makeprg, "cancelreturn": g:makeprg })<CR>
"}}}
"{{{ Automatically adjust quick fix window height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction
"}}}
"{{{ statusline
set statusline=
set statusline+=\ 
set statusline+=%f
set statusline+=%=
set statusline+=\ 
"}}}
"{{{ netrw
let g:netrw_banner = 0
let g:netrw_list_hide = '^\.\.\=/\=$'
"}}}
"{{{nvim-completion
set completeopt=menuone,noselect,noinsert
set shortmess+=c
let g:completion_enable_snippet = ''
let g:completion_enable_fuzzy_match = 1

inoremap <silent><expr> <c-n> completion#trigger_completion()
"}}}
"{{{ local rename
function s:local_rename() range
  let l:from = input("From: ")
  let l:to = input("To: ", l:from)
  execute a:firstline . ',' . a:lastline . 's/^' . l:from . '$/' . l:to . '/g'
  noh
endfunction

command! -nargs=0 -range LocalRename <line1>,<line2>call <SID>local_rename()

vnoremap <silent> <leader>r :LocalRename<CR>
"}}}
"{{{ window zoom
function! s:window_zoom()
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction

command! -nargs=0 ToggleWindowZoom call <SID>window_zoom()

nnoremap <silent> <c-w>f :ToggleWindowZoom<CR>
"}}}
"{{{ nvim-diagnostic
nnoremap <silent> ]d :NextDiagnostic<CR>
nnoremap <silent> [d :PrevDiagnostic<CR>
"}}}
"{{{ lua
function! s:invalidate_cache()
  let line = getline('.')
  let matches = matchlist(line, "local .* = require(\"\\(.*\\)\")")

  if len(matches) != 0
    let cache_path = matches[1]
    silent execute 'lua package.loaded["' . cache_path . '"] = nil'
    echo "Invalidated '" . cache_path . "'"
  endif
endfunction

nnoremap <silent> <c-l>f :luafile %<CR>
nnoremap <silent> <c-l>i :call <SID>invalidate_cache()<CR>
"}}}
"{{{ neogit
nnoremap <silent> <leader>g :Neogit<CR>
"}}}
"{{{ buffers
nnoremap <silent> <c-b>q :bw<CR>
nnoremap <silent> <c-b>Q :bw!<CR>
nnoremap <silent> <c-b>l :ls<CR>
nnoremap <silent> <c-b>p :bprevious<CR>
nnoremap <silent> <c-b>n :bnext<CR>
"}}}
"{{{ tabs
nnoremap <silent> <c-t>q :tabclose<CR>
nnoremap <silent> <c-t>l :tabs<CR>
nnoremap <silent> <c-t>p :tabprevious<CR>
nnoremap <silent> <c-t>n :tabnext<CR>
"}}}
"{{{ terminal
tnoremap <ESC> <c-\><c-n>
nnoremap <C-S>s :sp <bar> term<CR>
nnoremap <C-S>v :vsp <bar> term<CR>
nnoremap <C-S>q :bw!<CR>
autocmd TermOpen * setlocal nonumber norelativenumber
"}}}
"{{{ vim-commentary
nnoremap <leader>c gcc
vnoremap <leader>c gc
xmap <leader>c <Plug>Commentary
nmap <leader>c <Plug>CommentaryLine
omap <leader>c <Plug>Commentary
"}}}
"{{{ edit mappings
nnoremap <silent> <c-e>v :edit $MYVIMRC<CR>
nnoremap <silent> <c-e>g :edit $HOME/AppData/Local/nvim/ginit.vim<CR>
nnoremap <silent> <c-e>h :edit $HOME<CR>
if has('win32')
  nnoremap <silent> <c-e>n :edit $HOME/AppData/Roaming/nog/config.nog<CR>
else
  nnoremap <silent> <c-e>z :edit $HOME/.zshrc<CR>
  nnoremap <silent> <c-e>n :edit /mnt/c/Users/timun/AppData/Roaming/nog/config.nog<CR>
endif
"}}}
"{{{ navigation mappings
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>ef :Explore %:h<CR>
nnoremap <silent> <leader>ep :Explore .<CR>
"}}}
"{{{quickfix
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [q :cprev<CR>
nnoremap <silent> <leader>qo :copen<CR>
nnoremap <silent> <leader>qc :cclose<CR>
"}}}
"{{{Syntax
" Output the current syntax group
nnoremap <silent> <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
nnoremap <silent> <f9> :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>
"}}}
"{{{Windows specific
if has('win32')
  set shell=powershell
endif
"}}}
"{{{fzf
let $FZF_DEFAULT_COMMAND='rg -i --hidden --files -g "!.git"'
"}}}
