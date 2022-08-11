set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set number
set wildmode=longest,list
set incsearch
set hlsearch
set mouse=v
set showmatch
syntax on
set cursorline
set spell
set noswapfile
set background=dark
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set nofixendofline

autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp
autocmd BufNewFile,BufRead *.kt,*.udin,*.nos set filetype=kotlin
autocmd BufNewFile,BufRead *.ebnf set filetype=ebnf
autocmd BufNewFile,BufRead *.s7i,*.sd7 set filetype=seed7

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ CheckBackspace() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col=col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nnoremap <C-f> :NERDTree<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-x> :x<CR>

let g:ale_disable_lsp=1

call plug#begin("~/.vim/plugged")
  Plug 'cocopon/iceberg.vim'
  Plug 'gkeep/iceberg-dark'
  Plug 'honza/vim-snippets'
  Plug 'scrooloose/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdcommenter'
  Plug 'mhinz/vim-startify'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'cocopon/pgmnt.vim'
  Plug 'dense-analysis/ale'
  Plug 'itchyny/lightline.vim'
  Plug 'raimondi/delimitmate'
  Plug 'alaviss/nim.nvim'
  Plug 'udalov/kotlin-vim'
  Plug 'vim-scripts/ebnf.vim'
  Plug 'vala-lang/vala.vim'
call plug#end()

colorscheme iceberg
let g:lightline = { 'colorscheme': 'icebergDark' }
set nospell
set nofoldenable
