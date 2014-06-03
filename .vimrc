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

set shell=/bin/bash
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
" set relativenumber

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
" set foldlevel=20
set foldnestmax=20
set hidden

" recall cursor position for file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                         \ exe "normal g'\"" | endif

execute pathogen#infect()
execute pathogen#helptags()

set wildignore=*.o,*.out,*.bak
" python stuff
set wildignore+=*.pkl,*.ipynb,*.npy,*.mat,*.pyc,*.pyd,*.npz
" vim tmp files
set wildignore+=*.swp
" git files
set wildignore+=.git

let mapleader = "\<space>"

" toggle paste
nmap \p :set paste!<CR>

nnoremap <Leader>e :e <C-R>=expand("%:p:h")."/"<CR>
nnoremap <Leader>v :vsp <C-R>=expand("%:p:h")."/"<CR>
nnoremap <Leader>s :split <C-R>=expand("%:p:h")."/"<CR>
" nnoremap <Leader>t :tabnew <C-R>=expand("%:p:h")."/"<CR>
" nnoremap <Leader>f :bn <CR>
" nnoremap <Leader>b :bp <CR>
nnoremap <Leader>uu :source ~/.vimrc<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

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
nmap <Leader>a <Esc>:Ack!

"-------------------------------------------------------------------------------
" easy motion
"-------------------------------------------------------------------------------
" nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>w <Plug>(easymotion-w)
nmap t <Plug>(easymotion-t2)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" map <Leader> <Plug>(easymotion-prefix)

"-------------------------------------------------------------------------------
" Syntastic
"-------------------------------------------------------------------------------
let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_python_flake8_args='--ignore=E501'
" let g:syntastic_always_populate_loc_list=1

"-------------------------------------------------------------------------------
" CtrlP
"-------------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'

"-------------------------------------------------------------------------------
" Fugitive
"-------------------------------------------------------------------------------
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>

"-------------------------------------------------------------------------------
" Jedi-vim
"-------------------------------------------------------------------------------
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 0

"-------------------------------------------------------------------------------
" supertab
"-------------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<o-n-p>"

"-------------------------------------------------------------------------------
" expand region
"-------------------------------------------------------------------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
