autocmd!

"let $VIM = 'C:\Users\jkvam\'
let $VIM = $HOME

set nocompatible

"-------------------------------------------------------------------------------
" Enable plugins and file dependent indentation
"-------------------------------------------------------------------------------
filetype plugin on
filetype indent on
syntax enable

"set shell=zsh
set background=dark
set history=1000
set ruler
set ignorecase
set smartcase
set shortmess=atI
set smarttab
"set cindent
set shiftwidth=2
set tabstop=2
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
"highlight Folded ctermbg=darkgreen ctermfg=black
"highlight Search ctermbg=darkgreen ctermfg=black
"syn sync fromstart
"au BufReadPost * syn region javadoc start="/\*" end="\*/" transparent fold keepend
"au BufReadPost * syn region braces start="{" end="}" transparent fold
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                         \ exe "normal g'\"" | endif


set wildignore=*.o,*.out,*.bak,*.do,*.dep,*.ew*
set wildignore+=*.pbi,*.r43,*.pbd,*.d43,*.pbi,*.dbgdt,*.map,*.cspy.bat,*.dni
"abbreviations
iabbrev teh the
iabbrev hoem home

let mapleader = ","
"nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>d :tabclose<cr>
"nnoremap <leader>tm :tabmove
nnoremap <leader>n :tabnext<cr>
nnoremap <leader>p :tabprevious<cr>

"inoremap , ,<Space>

"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>

vnoremap ( s()<Esc>P<Right>%
vnoremap [ s[]<Esc>P<Right>%
vnoremap { s{}<Esc>P<Right>%

"nnoremap <leader>n :cn <CR>
"nnoremap <leader>p :cp <CR>
nnoremap <leader>e :e <C-R>=expand("%:p:h")."/"<CR>
nnoremap <leader>v :vsp <C-R>=expand("%:p:h")."/"<CR>
nnoremap <leader>s :split <C-R>=expand("%:p:h")."/"<CR>
"nnoremap <leader>t :tabnew <C-R>=expand("%:p:h")."/"<CR>
nnoremap <leader>z :CommandT<CR>
nnoremap <leader>f :bn <CR>
nnoremap <leader>b :bp <CR>
nnoremap <leader>uu :source ~/_vimrc<CR>

nmap <C-L> <C-W>l
nmap <C-H> <C-W>h
"nmap <C-J> <C-W>j
nmap <C-K> <C-W>w
noremap _ <C-W><
noremap + <C-W>>

map <C-F> :set hls!<bar> set hls?<CR>

"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"

"command Gtag !ctags.exe -f %:p:h\tags %:p:h\*

set t_Co=255
"let g:zenburn_high_Contrast=1
colorscheme zenburn
hi search ctermbg=223 ctermfg=238
hi incsearch ctermbg=216 ctermfg=242
"let g:solarized_termcolors=256
"colorscheme solarized

"set guifont=consolas:h11
syntax sync fromstart
