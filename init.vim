scriptencoding utf-8
let s:nvim = has('nvim')

" YCM python binary paths {{{
let g:python2_host_prog='/usr/bin/python2.7'
if filereadable($HOME.'/miniconda/bin/python3')
    let g:python3_host_prog=$HOME.'/miniconda/bin/python'
endif

" let g:python_host_prog=$HOME.'/miniconda/bin/python'
let g:python_host_prog='/usr/bin/python2.7'
let g:ycm_python_binary_path=$HOME.'/miniconda/bin/python'
" let g:ycm_path_to_python_interpreter=$HOME.'/miniconda/bin/python'
let g:ycm_python_interpreter_path=$HOME.'/miniconda/bin/python'
" }}}

" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

" Languages {{{

Plug 'davidhalter/jedi-vim'
Plug 'cespare/vim-toml'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" maintained vim-fish fork
Plug 'wilriker/vim-fish'
Plug 'hynek/vim-python-pep8-indent'
Plug 'tmhedberg/SimpylFold'
Plug 'lervag/vimtex'
" Plug 'othree/vajs.vim'
" }}}
"
" Colorschemes {{{
" Plug 'jnurmine/Zenburn'
" Plug 'morhetz/gruvbox'
" Plug 'mhinz/vim-janah'
Plug 'junegunn/seoul256.vim'
" }}}

" Plug 'unblevable/quick-scope' SUPER SLOW!+!!!! https://github.com/unblevable/quick-scope/issues/8
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-after-object'
Plug 'junegunn/vim-slash'

" Peekaboo extends " and @ in normal mode and <CTRL-R> in insert mode so you
" can see the contents of the registers.
" Plug 'junegunn/vim-peekaboo'

Plug 'farmergreg/vim-lastplace'
" Plug 'matze/vim-move'
" Plug 'uarun/vim-protobuf'
Plug 'alfredodeza/pytest.vim'
Plug 'abaldwin88/roamer.vim'

Plug 'jreybert/vimagit'

Plug 'sbdchd/neoformat'

if s:nvim
  Plug 'kassio/neoterm'
endif

Plug 'kshenoy/vim-signature'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

Plug 'janko-m/vim-test'



Plug 'vim-scripts/diffchar.vim'


Plug 'Valloric/ListToggle'

Plug 'Valloric/YouCompleteMe', { 'do': '/usr/bin/python install.py' }
Plug 'SirVer/ultisnips'
" Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}

" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'

Plug 'w0rp/ale'

Plug 'wellle/targets.vim'

Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-gutentags'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'machakann/vim-sandwich'

Plug 'osyo-manga/vim-over'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-eunuch'

" Plug 'mhinz/vim-startify'

Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'luochen1990/rainbow'

" Unused

" Plug 'RRethy/vim-illuminate'
" Plug 'junegunn/vim-oblique'
" Plug 'henrik/vim-indexed-search'
" Plug 'junegunn/vim-pseudocl'
" Plug 'mtth/cursorcross.vim'
" Plug 'haya14busa/incsearch.vim'
" Plug 'MarcWeber/vim-addon-local-vimrc'
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'Shougo/deoplete.nvim'
" Plug 'bfredl/nvim-ipy'
" Plug 'blueyed/vim-diminactive'
" Plug 'boucherm/ShowMotion'
" Plug 'dhruvasagar/vim-prosession'
" Plug 'hecal3/vim-leader-guide'
" Plug 'itchyny/lightline.vim'
" Plug 'justinmk/vim-sneak'
" Plug 'luochen1990/indent-detector.vim'
" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'mbbill/undotree'
" Plug 'naddeoa/vim-visual-page-percent'
" Plug 'rhysd/vim-operator-surround'
" Plug 'rhysd/vim-textobj-anyblock'
" Plug 't9md/vim-choosewin'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-obsession'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'vim-python/python-syntax'
" Plug 'xtal8/traces.vim'
" Plug 'zchee/deoplete-jedi'
" if has('mac')
"   Plug 'Valloric/YouCompleteMe', { 'do': 'MACOSX_DEPLOYMENT_TARGET=\"\" PATH=/usr/bin:$PATH ./install.py --clang-completer' }
" elseif has('unix')
"   Plug 'Valloric/YouCompleteMe', { 'do': 'python2.7 install.py --clang-completer' }
" endif

call plug#end()
" Plugins }}}

" Inccommmand {{{
if exists('&inccommand')
    set inccommand=split
endif
" }}}

" Terminal mappings {{{
if s:nvim && exists(':tnoremap')
    nnoremap <silent> <f4> :REPLSendLine<cr>
    vnoremap <silent> <f4> :REPLSendSelection<cr>

    command! -range=% REPLSendSelection call REPLSend(s:GetVisual())
    command! REPLSendLine call REPLSend([getline('.')])

    function! REPLSend(lines)
        call jobsend(g:last_term_job_id, add(a:lines, ''))
    endfunction

    function! s:GetVisual()
        let [l:lnum1, l:col1] = getpos("'<")[1:2]
        let [l:lnum2, l:col2] = getpos("'>")[1:2]
        let l:lines = getline(l:lnum1, l:lnum2)
        let l:lines[-1] = l:lines[-1][:l:col2 - 2]
        let l:lines[0] = l:lines[0][l:col1 - 1:]
        return l:lines
    endfunction

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
    augroup terminalstuff
        au TermOpen * let g:last_term_job_id = b:terminal_job_id
        au WinEnter term://* let g:last_term_job_id = b:terminal_job_id
        au WinEnter term://* startinsert
    augroup END

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
" }}}

" Basic options {{{
" syntax enable
" syntax sync fromstart

nnoremap ; :
" switch v and c-v
nnoremap v <C-V>
nnoremap <C-V> v
vnoremap v <C-V>
vnoremap <C-V> v

vnoremap < <gv
vnoremap > >gv

set wildoptions=pum
set pumblend=10
set shell=/bin/bash
set noshowmode
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
set backspace=indent,eol,start
set listchars=tab:▸\ ,extends:❯,precedes:❮
set list
set showbreak=↪
set breakindent
set synmaxcol=800
set nostartofline
set formatoptions=cqrt

set nowrap
set sidescroll=5
set showcmd
set showmatch
set cursorline
" set cursorcolumn
set matchtime=1
set equalalways
" Not sure why I had this here
" but it causes an error with vimtex
" let loaded_matchparen=1

" set lazyredraw
" }}}

" Mouse {{{
set mouse=a
map <ScrollWheelUp> <C-u>
map <ScrollWheelDown> <C-d>
" }}}

set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize

nnoremap <bs> <c-^>
nnoremap <c-6> <c-^>

" let g:python_highlight_all=1

" let &t_ut=''
" if has('gui_running') || has('nvim')
"     hi Normal 		guifg=#f6f3e8 guibg=#242424
" else
"     " Set the terminal default background and foreground colors, thereby
"     " improving performance by not needing to set these colors on empty cells.
"     hi Normal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
"     let &t_ti = &t_ti . "\033]10;#f6f3e8\007\033]11;#242424\007"
"     let &t_te = &t_te . "\033]110\007\033]111\007"
" endif

" Colorscheme {{{
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
"nnoremap <C-w>jj j
"nnoremap <C-w>j j

" inoremap ;u <Esc>viwUea
" inoremap <c-l> <Esc>viwUea

" write the file when you accidentally opened it without the right (root) privileges
cmap w!! w !sudo tee % > /dev/null

" filetype plugin on
" filetype indent on

" autocmd FileType startify setlocal fdm=manual
autocmd BufNewFile,BufRead *.pyi set syntax=python

augroup filestuff
    autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    "
    " inoremap <Enter> <Esc>

    " Files to check spelling on {{{
    autocmd BufRead,BufNewFile *.md,*.tex,*.rst setlocal spell
augroup END
" }}}

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

" {{{ clipboard paste
" vnoremap <Leader>y "+y
" vnoremap <Leader>d "+d
" nnoremap <Leader>p "+p
" nnoremap <Leader>P "+P
" vnoremap <Leader>p "+p
" vnoremap <Leader>P "+P
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
" augroup whitespace
"     autocmd BufWritePre *.py,*.tex,*.js,*.md,*.html,*.css,*.vim :%s/\s\+$//e
"     autocmd BufWritePre *.hs,*.scss,*.rst,*.rb,*.R :%s/\s\+$//e
" augroup END

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
" hi ActiveWindow ctermbg=16 | hi InactiveWindow ctermbg=233
" set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

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
" nmap t <Plug>(easymotion-bd-t2)

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
            \   'python': ['pycodestyle', 'pylint'],
            \   'vim': ['vint'],
            \   'r': ['lintr']
            \}
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'markdown': ['prettier'],
            \   'html': ['prettier'],
            \   'python': ['black'],
            \}
let g:ale_python_black_options = '-S -l 100 --py36'
" let g:ale_python_black_options = '-l 100 -S -t cpy38'
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" }}}
" FZF {{{
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
" augroup rainbow_files
"     autocmd!
"     autocmd FileType lisp,python,julia RainbowParentheses
" augroup END
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\}
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

" let g:indexed_search_mappings = 0
" noremap <Plug>(slash-after) :ShowSearchIndex<CR>

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
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='zenburn'
" let g:airline_theme='base16'
" let g:airline_theme='murrmur'
let g:airline_inactive_collapse = 1
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#fnamemod = ':~'
let g:airline#extensions#tabline#fnamecollapse = 1
" let g:airline_section_z = '(%{VisualPercent()}, line number, column number)'
" let g:airline_section_z = airline#section#create(['windowswap', '%3p%%'.spc, 'linenr', ':%3v '])
"
let g:visualPagePercent_display_width=10
" let g:airline_section_z = airline#section#create(['windowswap', '%{gutentags#statusline()}', 'linenr', ':%3v'])
" let g:airline_section_z = airline#section#create(['windowswap', '%{VisualPercent()}', 'linenr', ':%3v'])
" let g:airline_section_warning = airline#section#create(['%{ALEGetStatusLine()}'])
" let g:airline_section_warning = airline#section#create(['%{ale#statusline#Count()}'])
" let g:airline_section_error = airline#section#create([''])
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

" imap <silent> <buffer> ¡ <Plug>delimitMateS-BS
" " imap <C-\> <S-BS>
" imap <silent> <buffer> £ <Plug>delimitMateJumpMany
" imap <silent> <buffer> ¢ <Plug>delimitMateJumpMany

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
" {{{ jedi
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
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
" map <silent>sa <Plug>(operator-surround-append)
" map <silent>sd <Plug>(operator-surround-delete)
" map <silent>sr <Plug>(operator-surround-replace)
"
" nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
" nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)
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
" let g:lmap = {}
" call leaderGuide#register_prefix_descriptions('<Space>', 'g:lmap')
" nnoremap <silent> <leader> :LeaderGuide '<Space>'<CR>
" vnoremap <silent> <leader> :LeaderGuideVisual '<Space>'<CR>
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
" TODO look into NormalNC
" highlight ColorColumn ctermbg=235 guibg=#334444
" highlight ColorColumn ctermbg=235 guibg=#1e2828
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
" {{{ kite
let g:kite_auto_complete=0
" }}}

let g:lt_location_list_toggle_map = '<leader>o'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" vim: fdm=marker
