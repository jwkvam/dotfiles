autocmd!

set shell=zsh
set background=dark
set nocompatible
set ruler
set smarttab
set smartindent
set autoindent
set shiftwidth=2
set tabstop=2
set showmode
"set backspace=2
set backspace=indent,eol,start
set winheight=30
set winminheight=0
set winwidth=80
set winminwidth=10
set nowrap
set sidescroll=5
set showcmd
set showmatch
set matchtime=1
set equalalways
set et
set incsearch
set nohlsearch
set laststatus=2
set title
set viminfo='100,f0
set foldmethod=indent
set foldlevel=20
set foldnestmax=20
set hidden
highlight Folded ctermbg=darkgreen ctermfg=black
highlight Search ctermbg=darkgreen ctermfg=black
syn sync fromstart
"au BufReadPost * syn region javadoc start="/\*" end="\*/" transparent fold keepend
"au BufReadPost * syn region braces start="{" end="}" transparent fold
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                         \ exe "normal g'\"" | endif

set wildignore=*.o,*.out,*.bak,*.pdf,*.toc
"abbreviations
iabbrev teh the
iabbrev hoem home

"convenient mappings
map Q gq
"map ,n :cn <CR>
"map ,p :cp <CR>
map ,e :e <C-R>=expand("%:p:h")."/"<CR>
map ,v :vsp <C-R>=expand("%:p:h")."/"<CR>
map ,s :split <C-R>=expand("%:p:h")."/"<CR>
"map ,t :tabedit <C-R>=expand("%:p:h")."/"<CR>
map ,f :bn <CR>
map ,b :bp <CR>
map ,u :source ~/.vimrc<CR>
"map ,w :TlistToggle<CR>
map <C-L> <C-W>l
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k

" Toggle search highlights
map <C-F> :set hls!<bar> set hls?<CR>

map <F11> :sp tags<CR>:%s/^\([^	:]*:\)\=\([^	]*\).*/syntax keyword Tag \2/<CR>:wq! tags.vim<CR>/^<CR><F12>
map <F12> :so tags.vim<CR>

set statusline=%<%f%h%m%r\ {%n}%=%b\ 0x%B\ \ %l,%c%V\ %P

set t_Co=256
"set t_AF=^[[%?%p1%{8}%<%t3%p1%d%e%p1%{22}%+%d;1%;m
"set t_AB=^[[%?%p1%{8}%<%t4%p1%d%e%p1%{32}%+%d;1%;m
syntax enable
"if filereadable( "tags.vim" )
"	source tags.vim
"endif
"au BufReadPost * if filereadable( "tags.vim" ) | source tags.vim | endif
"au BufEnter * if filereadable( "tags.vim" ) | echo "HELLO" | endif

"load the types.vim highlighting file, if it exists
autocmd BufRead,BufNewFile *.[ch]* let fname = expand("%:p:h") . "/tags.vim"
autocmd BufRead,BufNewFile *.[ch]* if filereadable( fname ) | 
																			\ execute "so " . fname | endif
"autocmd BufRead,BufNewFile *.[ch]* if filereadable( fname ) | echo "SUCCESS" | endif

filetype plugin on
syntax sync fromstart

""""" Tagging functions
"autocmd BufEnter * doautocmd FileType
"
"au FileType cpp  map ,t :!ctags *.h *.cpp<CR>
"au FileType cpp  set cindent
"au FileType java map ,t :!ctags *.java<CR>
"au FileType c 	 map ,t :!ctags *.[ch]<CR>
"au FileType c 	 set cindent
"au FileType tex  set textwidth=80
"au FileType tex  iabbrev xx \cdot
