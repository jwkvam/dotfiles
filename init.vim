scriptencoding utf-8
" let g:python_host_prog='/Users/jacques/miniconda/bin/python'
" let g:python3_host_prog='/Users/jacques/miniconda/envs/py35/bin/python3'
" let g:ycm_path_to_python_interpreter='/Users/jacques/miniconda/bin/python'
" let g:ycm_python_binary_path='/Users/jacques/miniconda/bin/python'
" let g:ycm_path_to_python_interpreter='/Users/jacques/miniconda/bin/python'

let g:python_host_prog='/usr/bin/python2.7'
let g:python2_host_prog='/usr/bin/python2.7'
if filereadable($HOME.'/miniconda/bin/python3')
    let g:python3_host_prog=$HOME.'/miniconda/bin/python3'
endif
let g:ycm_path_to_python_interpreter='/usr/bin/python2.7'
let g:ycm_python_binary_path='/usr/bin/python2.7'
" let g:ycm_python_binary_path='/Users/jacques/miniconda/bin/python'
" let g:python_host_prog='/Users/jacques/miniconda/bin/python'
" let g:ycm_path_to_python_interpreter='/Users/jacques/miniconda/bin/python'

let s:nvim = has('nvim')

call plug#begin('~/.config/nvim/plugged')

Plug 'unblevable/quick-scope'
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-after-object'
" Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-slash'
" Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-peekaboo'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'farmergreg/vim-lastplace'
" Plug 'mtth/cursorcross.vim'
" Plug 'haya14busa/incsearch.vim'
" Plug 'lambdatoast/elm.vim'
" Plug 'mxw/vim-jsx'
" Plug 'othree/vajs.vim'
" Plug 'othree/vajs.vim'
Plug 'matze/vim-move'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'uarun/vim-protobuf'
Plug 'alfredodeza/pytest.vim'
Plug 'abaldwin88/roamer.vim'

Plug 'hecal3/vim-leader-guide'
Plug 'naddeoa/vim-visual-page-percent'

Plug 'jreybert/vimagit'

Plug 'sbdchd/neoformat'

if s:nvim
  Plug 'kassio/neoterm'
endif

Plug 'kshenoy/vim-signature'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

Plug 'janko-m/vim-test'

" Plug 'kballard/vim-fish'
Plug 'wilriker/vim-fish'

" Plug 'luochen1990/indent-detector.vim'

Plug 'vim-scripts/diffchar.vim'

" {{{ Color Plugins
Plug 'jnurmine/Zenburn'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-janah'
Plug 'junegunn/seoul256.vim'
" }}}

Plug 'Valloric/ListToggle'

" Plug 'Shougo/deoplete.nvim'
" Plug 'zchee/deoplete-jedi'
if has('mac')
  Plug 'Valloric/YouCompleteMe', { 'do': 'MACOSX_DEPLOYMENT_TARGET=\"\" PATH=/usr/bin:$PATH ./install.py --clang-completer' }
elseif has('unix')
  Plug 'Valloric/YouCompleteMe', { 'do': 'python2.7 install.py --clang-completer' }
endif

Plug 'hdima/python-syntax'
Plug 'SirVer/ultisnips'

" Plug 'boucherm/ShowMotion'
Plug 'tmhedberg/SimpylFold'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'nixprime/cpsm', { 'do': 'PATH=/usr/bin:$PATH ./install.sh' }
Plug 'Raimondi/delimitMate'

" Plug 'benekastah/neomake', {'commit': '5888211'}
" Plug 'benekastah/neomake'
Plug 'w0rp/ale'
" Plug 'luochen1990/rainbow'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'wellle/targets.vim'

Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'

Plug 'mbbill/undotree'

Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'MarcWeber/vim-addon-mw-utils'

" Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'easymotion/vim-easymotion'
" Plug 'justinmk/vim-sneak'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'terryma/vim-multiple-cursors'
Plug 'rhysd/vim-operator-surround'
Plug 'rhysd/vim-textobj-anyblock'

Plug 'osyo-manga/vim-over'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-eunuch'

" Plug 'tpope/vim-obsession'
" Plug 'dhruvasagar/vim-prosession'

Plug 'mhinz/vim-startify'

Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'

Plug 'blueyed/vim-diminactive'
Plug 't9md/vim-choosewin'

Plug 'lervag/vimtex'
" Plug 'bfredl/nvim-ipy'
" Plug '~/.vim/custom/dim_inactive'

call plug#end()

if exists('&inccommand')
    set inccommand=split
endif

if s:nvim && exists(':tnoremap')
    nnoremap <silent> <f4> :REPLSendLine<cr>
    vnoremap <silent> <f4> :REPLSendSelection<cr>

    command! -range=% REPLSendSelection call REPLSend(s:GetVisual())
    command! REPLSendLine call REPLSend([getline('.')])

    function! REPLSend(lines)
        call jobsend(g:last_term_job_id, add(a:lines, ''))
    endfunction

    function! s:GetVisual()
        let [lnum1, col1] = getpos("'<")[1:2]
        let [lnum2, col2] = getpos("'>")[1:2]
        let lines = getline(lnum1, lnum2)
        let lines[-1] = lines[-1][:col2 - 2]
        let lines[0] = lines[0][col1 - 1:]
        return lines
    endfunction

    au TermOpen * let g:last_term_job_id = b:terminal_job_id
    au WinEnter term://* let g:last_term_job_id = b:terminal_job_id

    tnoremap ˙ <c-\><c-n><c-w>h
    tnoremap ∆ <c-\><c-n><c-w>j
    tnoremap ˚ <c-\><c-n><c-w>k
    tnoremap ¬ <c-\><c-n><c-w>l

    tnoremap œ <c-\><c-n>ZQ

    nnoremap ˙ <c-w>h
    nnoremap ∆ <c-w>j
    nnoremap ˚ <c-w>k
    nnoremap ¬ <c-w>l
    " tnoremap <silent> <c-w>z <c-\><c-n>:ZoomWinTabToggle<cr>
    au WinEnter term://* startinsert

    " nnoremap Ò <c-w>v \| :term fish<CR>
    " nnoremap Ô <c-w>s \| :term fish<CR>
    " nnoremap  :set nosplitbelow<CR> \| <c-w>s \| :set splitbelow<CR> \| :term fish<CR>
    " nnoremap Ó :set nosplitright<CR> \| <c-w>v \| :set splitright<CR> \| :term fish<CR>

    nnoremap Ò :vsp term://fish<CR> \| :startinsert<CR>
    nnoremap Ô :split term://fish<CR> \| :startinsert<CR>
    nnoremap  :set nosplitbelow<CR> \| <c-w>s \| :set splitbelow<CR> \| :term fish<CR>
    nnoremap Ó :set nosplitright<CR> \| <c-w>v \| :set splitright<CR> \| :term fish<CR>

    " let g:neoterm_position ='horizontal'
endif

" Basic options {{{
" syntax enable
" syntax sync fromstart

nnoremap ; :
" nnoremap : ;
nnoremap v <C-V>
nnoremap <C-V> v
vnoremap v <C-V>
vnoremap <C-V> v

set shell=/bin/bash
set scrolloff=1
set history=10000
set termguicolors
set ruler
set ignorecase
set smartcase
set shortmess=atI
set smarttab
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set showmode
set backspace=indent,eol,start
set listchars=tab:▸\ ,extends:❯,precedes:❮
set list
set showbreak=↪
set breakindent
set synmaxcol=800
set nostartofline
set formatoptions=cqrt
" }}}


set mouse=a
map <ScrollWheelUp> <C-u>
map <ScrollWheelDown> <C-d>

set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize

let g:python_highlight_all=1

" Colorscheme {{{
set background=dark
" autocmd ColorScheme janah highlight Normal ctermbg=230
" colorscheme janah
colorscheme seoul256
" hi search ctermbg=223 ctermfg=238
" hi incsearch ctermbg=216 ctermfg=242
" }}}

" swap i_CTRL-C and i_CTRL-[
inoremap <C-[> <C-c>
inoremap <C-c> <Esc>
" inoremap jk <Esc>
"

inoremap ;u <Esc>viwUea
inoremap <c-l> <Esc>viwUea

" :w!! 
" write the file when you accidentally opened it without the right (root) privileges
cmap w!! w !sudo tee % > /dev/null

" filetype plugin on
" filetype indent on

" autocmd FileType startify setlocal fdm=manual
" 
" inoremap <Enter> <Esc>

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell

" Window dimensions {{{
set winheight=30
" set winminheight=1
set winwidth=80
" set winminwidth=1
" Resize splits when the window is resized
" au VimResized * :wincmd =
" }}}
" Backups {{{
" from steve losh's vimrc
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.
set undofile

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), 'p')
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), 'p')
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), 'p')
endif
" }}}

set nowrap
set sidescroll=5
set showcmd
set showmatch
set cursorline
set cursorcolumn
set matchtime=1
set equalalways
" Not sure why I had this here
" but it causes an error with vimtex
" let loaded_matchparen=1

" set lazyredraw

" {{{ clipboard paste
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
" }}}
nnoremap Y y$

" {{{ Searching
" nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>:set hlsearch<cr>
" nnoremap n nzzzv
" nnoremap N Nzzzv
set incsearch
set nohlsearch
map <C-F> :set hls!<bar> set hls?<CR>
" }}}

set laststatus=2
set title
set viminfo='100,f0
" if s:nvim
"   set shada='100,f0
" endif
set foldmethod=indent
set foldlevelstart=1
set foldnestmax=20
set hidden

set noreadonly

" remove trailing whitespace from python files
augroup whitespace
    autocmd BufWritePre *.py,*.tex,*.js,*.md,*.html,*.css :%s/\s\+$//e
    autocmd BufWritePre *.hs,*.scss,*.rst,*.rb :%s/\s\+$//e
augroup END

" " recall cursor position for file {{{
" au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
"       \ exe "normal g'\"" | endif
" " }}}

" Files to ignore {{{
set wildignore=*.o,*.out,*.bak,*.log
" python
set wildignore+=*.pkl,*.ipynb,*.npy,*.mat,*.pyc,*.pyd,*.npz,*.jbl
" vim tmp
set wildignore+=*.swp
" git
set wildignore+=.git
" latex
set wildignore+=*.aux,*.fls,*.out,*.pdf,*.fdb_latexmk,*.blg,*.bbl
" }}}

let g:mapleader = "\<space>"

" toggle paste
nmap <C-\> :set paste!<CR>

nnoremap <Leader>uu :source ~/.config/nvim/init.vim<CR>

nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <leader>R :%s//
vnoremap <leader><C-r> "vy:%s/<C-r>v//g<Left><Left>

" inoremap <Tab> <C-O>za
" nnoremap <Tab> za
" onoremap <Tab> <C-C>za
" vnoremap <Tab> zf

" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" this is really <c-h> but mapped to some weird unicode
" nnoremap � <C-W><C-H>

nnoremap <silent> <Tab> @=(foldlevel('.')?'za':"\<Space>")<CR>

set splitbelow
set splitright


noremap _ <C-W><
noremap + <C-W>>


" Highlight Margin {{{
hi ColorMargin ctermbg=magenta

function! MarkMargin (on, margin)
    if exists('b:MarkMargin')
        try
            call matchdelete(b:MarkMargin)
        catch /./
        endtry
        unlet b:MarkMargin
    endif
    if a:on
        let b:MarkMargin = matchadd('ColorMargin', '\%' . (a:margin + 1) . 'v', 100)
    endif
endfunction

augroup MarkMargin
    autocmd!
    autocmd  BufEnter *.py :call MarkMargin(1, 100)
augroup END
" }}}

set tags=tags;

" easy motion {{{

" nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)
map <Leader>l <Plug>(easymotion-lineanywhere)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-lineanywhere)
map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>e <Plug>(easymotion-bd-e)
map <Leader>b <Plug>(easymotion-b)
" map <Leader>r <Plug>(easymotion-jumptoanywhere)
nmap t <Plug>(easymotion-bd-t2)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" map <Leader> <Plug>(easymotion-prefix)
" }}}
" easy align {{{
vmap <Enter> <Plug>(EasyAlign)
" nmap <Leader>a <Plug>(EasyAlign)
" }}}
" ALE {{{
let g:ale_linters = {
            \   'python': ['pylint'],
            \   'vim': ['vint'],
            \}
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" }}}
" FZF {{{ =============================================================================
" Set the following env variable to get nice file filtering
" FZF_DEFAULT_COMMAND 'ag -g ""'

" noremap <silent> <C-p> :call fzf#run()<CR>
" noremap <silent> <C-p> :call fzf#run()<CR>
" Open files in horizontal split
" 
let g:fzf_files_options = '--preview "highlight --failsafe -O ansi {} 2> /dev/null | head -'.&lines.'"'

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
  " return system('fzf-file-widget')
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <silent> <c-p> :ProjectFiles<CR>
nnoremap <silent> <leader>. :Tags<CR>
let g:fzf_layout = {'down': '~40%'}
let g:fzf_action = {
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \ }

" xmap <C-p> <plug>(fzf-maps-x)
" omap <C-p> <plug>(fzf-maps-o)
" nmap <leader>. <plug>(fzf-maps-n)
" xmap <leader>. <plug>(fzf-maps-x)
" omap <leader>. <plug>(fzf-maps-o)
" }}}
" CtrlP {{{
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlPMixed'
" let g:ctrlp_by_filename = 1
" nnoremap <Leader>. :CtrlPTag<cr>
" let g:ctrlp_custom_ignore = {
"       \ 'dir': 'datasets\|build\|htmlcov',
"       \ }
"
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
" }}}
" Fugitive {{{
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
" }}}
" supertab {{{
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<o-n-p>"
" }}}
" expand region {{{
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}
" {{{ ctrlsf
" nnoremap <Leader>s :CtrlSFOpen<CR>
let g:ctrlsf_ackprg='rg'
nmap <Leader>s <Plug>CtrlSFCwordPath
vmap <Leader>s <Plug>CtrlSFVwordExec
let g:ctrlsf_confirm_save=0
" nnoremap <C-F>n <Plug>(CtrlSFPrompt)
" xnoremap <C-F>f <Plug>(CtrlSFVwordExec)
" }}}
" Ag motions {{{

" Motions to Ag for things.  Works with pretty much everything, including:
"
"   w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
"
" Awesome.
"
" Note: If the text covered by a motion contains a newline it won't work.  Ag
" searches line-by-line.
"
" nnoremap <silent> <leader>s :set opfunc=<SID>AgMotion<CR>g@
" xnoremap <silent> <leader>s :<C-U>call <SID>AgMotion(visualmode())<CR>
"
" nnoremap <leader>a :Ag! '\b<c-r><c-w>\b'<cr>
" xnoremap <silent> <leader>a :<C-U>call <SID>AgMotion(visualmode())<CR>
"
" function! s:CopyMotionForType(type)
"     if a:type ==# 'v'
"         silent execute "normal! `<" . a:type . "`>y"
"     elseif a:type ==# 'char'
"         silent execute "normal! `[v`]y"
"     endif
" endfunction
"
" function! s:AgMotion(type) abort
"     let reg_save = @@
"     call s:CopyMotionForType(a:type)
"     execute "normal! :Ag! --literal " . shellescape(@@) . "\<cr>"
"     let @@ = reg_save
" endfunction

" }}}
" Rainbow Parentheses {{{
augroup rainbow_files
    autocmd!
    autocmd FileType lisp,python,julia RainbowParentheses
augroup END
let g:rainbow_active = 1
" }}}
" Incremental Search {{{
" map / <Plug>(incsearch-forward)
" map ? <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
" }}}
" IncSearch {{{
" :h g:incsearch#auto_nohlsearch
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
" let g:incsearch#auto_nohlsearch = 1
" map n  <Plug>(incsearch-nohl-n)
" map N  <Plug>(incsearch-nohl-N)
" map *  <Plug>(incsearch-hl-*)
" map #  <Plug>(incsearch-nohl-#)
" map g* <Plug>(incsearch-nohl-g*)
" map g# <Plug>(incsearch-nohl-g#)
" }}}
" Oblique/Slash {{{
function! s:flash()
  for l:i in range(1, 3)
    set cursorline!
    redraw
    sleep 20m
  endfor
  set cursorline!
endfunction

noremap <plug>(slash-after) zz
" noremap <plug>(slash-after) <sid>flash()

" let g:oblique#incsearch_highlight_all = 1
" let g:oblique#clear_highlight = 0
" autocmd! User ObliqueStar
" autocmd! User ObliqueRepeat
"
" autocmd User ObliqueStar   normal! zz
" autocmd User ObliqueRepeat normal! zz
" }}}
" Airline {{{
" let g:airline_theme='powerlineish'
" let g:airline#extensions#neomake#enabled = 0
let g:airline_theme='zenburn'
" let g:airline_theme='base16'
" let g:airline_theme='murrmur'
let g:airline_inactive_collapse = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#fnamemod = ':~'
let g:airline#extensions#tabline#fnamecollapse = 1
" let g:airline_section_z = '(%{VisualPercent()}, line number, column number)'
" let g:airline_section_z = airline#section#create(['windowswap', '%3p%%'.spc, 'linenr', ':%3v '])
"
let g:visualPagePercent_display_width=10
let g:airline_section_z = airline#section#create(['windowswap', '%{VisualPercent()}', 'linenr', ':%3v'])
let g:airline_section_warning = airline#section#create(['%{ALEGetStatusLine()}'])
let g:airline_section_error = airline#section#create([''])
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
" }}}
" DBext {{{
" let g:dbext_default_profile_PG = 'type=PGSQL:user=jacques:passwd=:dbname=energyai_development'
" }}}
" Better Digraphs {{{
" inoremap <expr>  <C-K>   BDG_GetDigraph()
" }}}
" Drag Visuals {{{
vmap <expr> <LEFT>  DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN>  DVB_Drag('down')
vmap <expr> <UP>    DVB_Drag('up')
" }}}
" UndoTree {{{
nnoremap <F5> :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1
let g:undotree_WindowLayout=2
" }}}
" DelimitMate {{{
" in iTerm2 I have {S},{C}-{BS,CR} mapped to ™¡£¢
" inoremap <C-Tab> <C-R>=delimitMate#JumpAny()<CR>
" inoremap <C-Tab> <Plug>delimitMateJumpMany
" inoremap <C-\> @<Plug>delimitMateJumpMany
" imap <silent> <buffer> <C-\> <Plug>delimitMateJumpMany

imap <silent> <buffer> ¡ <Plug>delimitMateS-BS
" imap <C-\> <S-BS>
imap <silent> <buffer> £ <Plug>delimitMateJumpMany
imap <silent> <buffer> ¢ <Plug>delimitMateJumpMany

" imap <silent> <buffer> <S-F2> <Plug>delimitMateS-BS
" imap <silent> <buffer> <S-F1> <Plug>delimitMateS-BS
" imap <silent> <buffer> <C-\>  <Plug>delimitMateS-BS

"
" inoremap <S-F4> <Plug>delimitMateJumpMany
" inoremap <S-F3> <Plug>delimitMateJumpMany

" imap <expr> <CR> pumvisible() ? "\<C-Y>" : "<Plug>delimitMateCR"
" imap <expr> <C-CR> pumvisible() ? "\<C-Y>" : "<Plug>delimitMateJumpMany"
" imap <expr> <S-CR> pumvisible() ? "\<C-Y>" : "<Plug>delimitMateJumpMany"

" hell({})
" <C-R>=delimitMat#JumpAny()<BS>
" }}}
" deoplete {{{
" autocmd CompleteDone * pclose!
" let g:deoplete#enable_at_startup = 1
" }}}
" youcompleteme {{{
" let g:ycm_key_list_select_completion=['<C-n>']  ", '<Down>']
" let g:ycm_key_list_previous_completion=['<C-p>']  ", '<Up>']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_server_log_level = 'info'

set completeopt=menuone,preview
"let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_seed_identifiers_with_syntax = 1

let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'qf' : 1,
        \ 'unite' : 1,
        \ 'vimwiki' : 1,
        \ 'infolog' : 1,
        \ 'mail' : 1
        \}
" }}}
" ultisnips {{{
let g:UltiSnipsExpandTrigger='<c-l>'
" let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
let g:ultisnips_python_style='numpy'

" https://github.com/Valloric/YouCompleteMe/issues/36
" Enable tabbing through list of results
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ''
endfunction

augroup snipsexpand
    au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
augroup END

" Expand snippet or return
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
    endif
endfunction

" Set <space> as primary trigger
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>


" }}}
" pandoc {{{
let g:pandoc#syntax#conceal#use = 0
nnoremap <Leader>c :Pandoc --webtex html<CR>
" }}}
" gitgutter {{{
" nnoremap <Leader>hp <NOP>
let g:gitgutter_signs = 1
let g:gitgutter_max_signs = 2000
nnoremap  <Space><Space>hp     <Plug>GitGutterPreviewHunk
nnoremap  <Space><Space>hr     <Plug>GitGutterRevertHunk
nnoremap  <Space><Space>hs     <Plug>GitGutterStageHunk
" }}}
" showmotion {{{
" nnoremap <Leader>hp <NOP>
" nmap  <silent> w <Plug>(show-motion-both-w)
" }}}
" vim-after-object {{{
augroup vimafterobject
    autocmd VimEnter * call after_object#enable('=', '#')
augroup END
" }}}
" vim-operator-surround {{{

" operator mappings
" TODO resolve this with vim-sneak
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)
" }}}
" {{{ diffchar
let g:DiffUpdate=1
" }}}
" {{{ vim-signature
" This function returns the highlight group used by git-gutter depending on how the line was edited (added/modified/deleted)
" It must be placed in the vimrc (or in any file that is sourced by vim)
let g:SignatureDeferPlacement=0
" function! SignatureGitGutter(lnum)
"     let l:lnum = a:lnum
"     let gg_line_state = filter(copy(gitgutter#diff#process_hunks(gitgutter#hunk#hunks())), 'v:val[0] == l:lnum')
"     "echo gg_line_state
"
"     if len(gg_line_state) == 0
"         return 'Exception'
"     endif
"
"     if gg_line_state[0][1] =~ 'added'
"         return 'GitGutterAdd'
"     elseif gg_line_state[0][1] =~ 'modified'
"         return 'GitGutterChange'
"     elseif gg_line_state[0][1] =~ 'removed'
"         return 'GitGutterDelete'
"     endif
" endfunction
"
" " Next, assign it to g:SignatureMarkTextHL
" let g:SignatureMarkTextHL = 'SignatureGitGutter(a:lnum)'

" Now everytime Signature wants to place a sign, it calls this function and thus, we can dynamically assign a Highlight group g:SignatureMarkTextHL
" The advantage of doing it this way is that this decouples Signature from git-gutter. Both can remain unaware of the other.

" }}}
" {{{ startify

" }}}
" {{{ leader-guide
let g:lmap = {}
call leaderGuide#register_prefix_descriptions('<Space>', 'g:lmap')
nnoremap <silent> <leader> :LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :LeaderGuideVisual '<Space>'<CR>
" }}}
" {{{ vim-test
let g:test#strategy = 'neoterm'
" {{{ vim-move
let g:move_key_modifier = 'C'
" }}}
" {{{ cursorcross
" let g:cursorcross_dynamic = 'clw'
" }}}
" {{{ diminactive
" highlight ColorColumn ctermbg=235 guibg=#334444
highlight ColorColumn ctermbg=235 guibg=#1e2828
" highlight ColorColumn ctermbg=0 guibg=#004444
" highlight ColorColumn ctermbg=255 guibg=#a9a9a9
" let g:diminactive_use_syntax = 1
" }}}
" {{{ pytest
" Pytest
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest function -s<CR>
nmap <silent><Leader>td <Esc>:Pytest function --pdb<CR>
nmap <silent><Leader>ts <Esc>:Pytest session<CR>
nmap <silent><Leader>te <Esc>:Pytest fails<CR>
" }}}
" {{{
" autocmd BufEnter * :call halo#run({'intervals': [200, 200, 200], 'shape': 'cross2halo1'})
" }}}
" Digraphs {{{
" ±
:dig pm 177
" ²
:dig 22 178
" ∏
:dig PI 8719
" ∑
:dig SM 8721
" √
:dig sq 8730
" ∞
:dig if 8734
" Γ
:dig GG 915
" Δ
:dig DD 916
" α
:dig aa 945
" β
:dig bb 946
" γ
:dig gg 947
" δ
:dig dd 948
" ε
:dig ee 949
" η
:dig nn 951
" μ
:dig mu 956
" τ
:dig ta 964
" λ
:dig ll 955
" π
:dig pi 960
" σ
:dig ss 963
" }}}
" {{{ quick replace
function! s:gn_next()
  augroup gn_next_repeat
    autocmd!
    autocmd CursorMoved <buffer>
          \ execute "autocmd! gn_next_repeat" |
          \ silent! call repeat#set(v:operator . "\<Plug>(gn-next)" . (v:operator == 'c' ? "\<c-a>\<esc>" : '')) |
          \ normal! n
  augroup END
  return '\<esc>:let &hlsearch=&hlsearch\<cr>' . v:operator . 'gn'
endfunction

function! s:match_visual()
  let l:reg = @@
  normal! gvy
  let @/ = '\V' . escape(@@, '\')
  let @@ = l:reg
endfunction

onoremap <expr> <Plug>(gn-next) <SID>gn_next()

nmap <Plug>(quick-replace) :let @/ = '\V\<' . escape(expand('<cword>'), '\') . '\>'<cr>c<Plug>(gn-next)
xmap <Plug>(quick-replace) :<c-u>call <SID>match_visual()<cr>c<Plug>(gn-next)

nmap <leader>f <Plug>(quick-replace)
xmap <leader>f <Plug>(quick-replace)
" }}}
" {{{ choosewin
nmap Q <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
" }}}

let g:lt_location_list_toggle_map = '<leader>o'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" vim: fdm=marker
