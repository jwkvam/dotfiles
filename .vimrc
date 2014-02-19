autocmd!

let $VIM = $HOME
set nocompatible

"-------------------------------------------------------------------------------
" Enable plugins and file dependent indentation
"-------------------------------------------------------------------------------
filetype plugin on
filetype indent on
syntax enable
syntax sync fromstart

"set shell=zsh
set background=dark
set history=1000
set ruler
set ignorecase
set smartcase
set shortmess=atI
set smarttab
"set cindent
set shiftwidth=4
set tabstop=4
set showmode
set backspace=indent,eol,start
set expandtab

"-------------------------------------------------------------------------------
" window dimensions
"-------------------------------------------------------------------------------
set winheight=30
set winminheight=0
set winwidth=80
set winminwidth=10

"-------------------------------------------------------------------------------
"
"-------------------------------------------------------------------------------
set nowrap
set sidescroll=5
set showcmd
set showmatch
set matchtime=1
set equalalways
let loaded_matchparen = 1

"-------------------------------------------------------------------------------
" searching
"-------------------------------------------------------------------------------
set incsearch
set nohlsearch

set laststatus=2
set title
set viminfo='100,f0
set foldmethod=indent
set foldlevel=20
set foldnestmax=20
set hidden

" recall cursor position for file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                         \ exe "normal g'\"" | endif

execute pathogen#infect()

set wildignore=*.o,*.out,*.bak,*.do,*.dep,*.ew*
" python stuff
set wildignore+=*.pkl,*.ipynb,*.npy,*.mat,*.pyc,*.pyd
set wildignore+=*.pbi,*.r43,*.pbd,*.d43,*.pbi,*.dbgdt,*.map,*.cspy.bat,*.dni

let mapleader = ","

" toggle paste
nmap \p :set paste!<CR>

nnoremap <leader>e :e <C-R>=expand("%:p:h")."/"<CR>
nnoremap <leader>v :vsp <C-R>=expand("%:p:h")."/"<CR>
nnoremap <leader>s :split <C-R>=expand("%:p:h")."/"<CR>
" nnoremap <leader>t :tabnew <C-R>=expand("%:p:h")."/"<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :bn <CR>
nnoremap <leader>b :bp <CR>
nnoremap <leader>uu :source ~/.vimrc<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

noremap _ <C-W><
noremap + <C-W>>

map <C-F> :set hls!<bar> set hls?<CR>

set t_Co=256
"let g:zenburn_high_Contrast=1
colorscheme zenburn
hi search ctermbg=223 ctermfg=238
hi incsearch ctermbg=216 ctermfg=242

"-------------------------------------------------------------------------------
" PLUGINS
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" Ack.vim
"-------------------------------------------------------------------------------
let g:ackprg = 'ag --nogroup --nocolor --column'

"-------------------------------------------------------------------------------
" Syntastic
"-------------------------------------------------------------------------------
let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_always_populate_loc_list=1

"-------------------------------------------------------------------------------
" CtrlP
"-------------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'

"-------------------------------------------------------------------------------
" Fugitive
"-------------------------------------------------------------------------------
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

"-------------------------------------------------------------------------------
" TComment
"-------------------------------------------------------------------------------
noremap <leader>cc :TComment<CR>
