let $VIM = $HOME

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-after-object'
Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-peekaboo'

Plug 'kshenoy/vim-signature'

Plug 'vim-scripts/diffchar.vim'
Plug 'jnurmine/Zenburn'

Plug 'Valloric/ListToggle'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }

Plug 'SirVer/ultisnips'


Plug 'boucherm/ShowMotion'
Plug 'tmhedberg/SimpylFold'
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/dbext.vim'
Plug 'Raimondi/delimitMate'

Plug 'benekastah/neomake'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/syntastic'
Plug 'wellle/targets.vim'

Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'

Plug 'mbbill/undotree'

Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'MarcWeber/vim-addon-mw-utils'

Plug 'bling/vim-airline'
Plug 'craigemery/vim-autotag'
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kristijanhusak/vim-multiple-cursors'
Plug 'rhysd/vim-operator-surround'
Plug 'rhysd/vim-textobj-anyblock'

Plug 'osyo-manga/vim-over'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rsi'

Plug 'dhruvasagar/vim-prosession'

Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'

" Plug '~/vim/custom/

call plug#end()

if has('nvim') && exists(':tnoremap')
    nnoremap <silent> <f4> :REPLSendLine<cr>
    vnoremap <silent> <f4> :REPLSendSelection<cr>

    command! -range=% REPLSendSelection call REPLSend(s:GetVisual())
    command! REPLSendLine call REPLSend([getline('.')])

    function! REPLSend(lines)
        call jobsend(g:last_term_job_id, add(a:lines, ''))
    endfunction

    " x = 3
    " print(x)
    " import numpy as np
    " np.__version__
    " x**2

    function! s:GetVisual()
        let [lnum1, col1] = getpos("'<")[1:2]
        let [lnum2, col2] = getpos("'>")[1:2]
        let lines = getline(lnum1, lnum2)
        let lines[-1] = lines[-1][:col2 - 2]
        let lines[0] = lines[0][col1 - 1:]
        return lines
    endfunction

    au TermCreate * let g:last_term_job_id = b:term_job_id

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

    nnoremap Ò <c-w>v \| :term fish<CR>
    nnoremap Ô <c-w>s \| :term fish<CR>
endif

" Pathogen {{{
" execute pathogen#infect()
" execute pathogen#helptags()
" }}}

" Basic options {{{
syntax enable
syntax sync fromstart

nnoremap ; :
nnoremap v <C-V>
nnoremap <C-V> v
vnoremap v <C-V>
vnoremap <C-V> v

set shell=/bin/bash
set background=dark
set history=1000
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

set ssop=blank,buffers,curdir,folds,help,options,tabpages,winsize

" Colorscheme {{{
" set t_Co=256
" let g:zenburn_high_Contrast=1
colorscheme zenburn
hi search ctermbg=223 ctermfg=238
hi incsearch ctermbg=216 ctermfg=242
" }}}

" swap i_CTRL-C and i_CTRL-[
inoremap <C-[> <C-c>
inoremap <C-c> <Esc>
inoremap jk <Esc>

filetype plugin on
filetype indent on

" autocmd FileType startify setlocal fdm=manual

autocmd BufRead,BufNewFile *.md setlocal spell

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
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
" }}}

set nowrap
set sidescroll=5
set showcmd
set showmatch
set cursorline
set matchtime=1
set equalalways
let loaded_matchparen=1

" set lazyredraw

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
set foldmethod=indent
set foldlevelstart=1
set foldnestmax=20
set hidden

set noro

" remove trailing whitespace from python files
autocmd BufWritePre *.py :%s/\s\+$//e

" recall cursor position for file {{{
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                         \ exe "normal g'\"" | endif
" }}}

" Files to ignore {{{
set wildignore=*.o,*.out,*.bak,*.log
" python
set wildignore+=*.pkl,*.ipynb,*.npy,*.mat,*.pyc,*.pyd,*.npz,*.jbl
" vim tmp
set wildignore+=*.swp
" git
set wildignore+=.git
" latex
set wildignore+=*.aux,*.fls,*.out,*.pdf,*.fdb_latexmk
" }}}

let mapleader = "\<space>"

" toggle paste
nmap <C-\> :set paste!<CR>

nnoremap <Leader>uu :source ~/.vimrc<CR>

nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <leader>R :%s//
vnoremap <leader><C-r> "vy:%s/<C-r>v//g<Left><Left>

" inoremap <Tab> <C-O>za
" nnoremap <Tab> za
" onoremap <Tab> <C-C>za
" vnoremap <Tab> zf

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
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
hi ColorColumn ctermbg=magenta

function! MarkMargin (on)
    if exists('b:MarkMargin')
        try
            call matchdelete(b:MarkMargin)
        catch /./
        endtry
        unlet b:MarkMargin
    endif
    if a:on
        let b:MarkMargin = matchadd('ColorColumn', '\%81v', 100)
    endif
endfunction

augroup MarkMargin
    autocmd!
    autocmd  BufEnter *.py :call MarkMargin(1)
augroup END
" }}}

set tags=tags;

" Ag.vim {{{
"
let g:agprg = 'ag --smart-case --nogroup --nocolor --column'
nnoremap <Leader>a :Ag!<space>

" }}}
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
nmap t <Plug>(easymotion-t2)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" map <Leader> <Plug>(easymotion-prefix)
" }}}
" easy align {{{
vmap <Enter> <Plug>(EasyAlign)
" nmap <Leader>a <Plug>(EasyAlign)
" }}}
" Neomake {{{
autocmd! BufWritePost *.py Neomake
autocmd! BufWritePost *.md Neomake!
let g:neomake_error_sign = {
    \ 'text': '✗',
    \ 'texthl': 'ErrorMsg'
    \ }
let g:neomake_warning_sign = {
    \ 'text': '⚠',
    \ 'texthl': 'WarningMsg'
    \ }

let g:neomake_python_pylint_maker = {
            \ 'args': [
            \ '-f', 'text',
            \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
            \ '-r', 'n',
            \ '--load-plugins', 'pylint_django'
        \ ],
        \ 'errorformat':
            \ '%A%f:%l:%c:%t: %m,' .
            \ '%A%f:%l: %m,' .
            \ '%A%f:(%l): %m,' .
            \ '%-Z%p^%.%#,' .
            \ '%-G%.%#',
        \ }
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_markdown_enabled_makers = ['make']
" }}}
" Syntastic {{{
nnoremap <Leader><Leader>d :SyntasticCheck<CR>
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "active",
      \ "active_filetypes": ["ruby", "php"],
      \ "passive_filetypes": ["python"] }
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_python_checkers=['python', 'pylint']
let g:syntastic_python_pylint_args = '--load-plugins pylint_django'
" let g:syntastic_python_pylint_args = '--load-plugins pylint_django -E'

" let g:syntastic_python_checkers=['python', 'flake8']
" let g:syntastic_python_flake8_args = '--ignore=E501'
" " indent multiple of 4
" let g:syntastic_python_flake8_args .= ',E111'
" " line is underindented
" let g:syntastic_python_flake8_args .= ',E128'
" " line underindented for hanging indent
" let g:syntastic_python_flake8_args .= ',E121'
" " continuation line with same indent as logical line
" let g:syntastic_python_flake8_args .= ',E125'
" " continuation line over indented
" let g:syntastic_python_flake8_args .= ',E127'
" " multiple statements on one line (debuggers)
" let g:syntastic_python_flake8_args .= ',E702'
" " visually indented line with same indent as next logical line [E129]
" let g:syntastic_python_flake8_args .= ',E129'
let g:syntastic_always_populate_loc_list = 1
" }}}
" CtrlP {{{
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlPMixed'
" let g:ctrlp_by_filename = 1
nnoremap <Leader>. :CtrlPTag<cr>
let g:ctrlp_custom_ignore = {
      \ 'dir': 'datasets\|build',
      \ }
" }}}
" Fugitive {{{
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
" }}}
" Jedi-vim {{{
" let g:jedi#use_splits_not_buffers = "left"
" let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 1
" }}}
" supertab {{{
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<o-n-p>"
" }}}
" expand region {{{
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
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

nnoremap <silent> <leader>s :set opfunc=<SID>AgMotion<CR>g@
xnoremap <silent> <leader>s :<C-U>call <SID>AgMotion(visualmode())<CR>

" nnoremap <bs> :Ag! '\b<c-r><c-w>\b'<cr>
" xnoremap <silent> <bs> :<C-U>call <SID>AgMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AgMotion(type) abort
    let reg_save = @@
    call s:CopyMotionForType(a:type)
    execute "normal! :Ag! --literal " . shellescape(@@) . "\<cr>"
    let @@ = reg_save
endfunction

" }}}
" Rainbow Parentheses {{{
let g:rainbow_active = 1
" }}}
" Incremental Search {{{
" map / <Plug>(incsearch-forward)
" map ? <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
" }}}
" Oblique {{{
function! s:flash()
  for _ in range(1, 3)
    set cursorline!
    redraw
    sleep 20m
  endfor
  set cursorline!
endfunction
let g:oblique#incsearch_highlight_all = 1
" let g:oblique#clear_highlight = 0
autocmd! User ObliqueStar
autocmd! User ObliqueRepeat

autocmd User ObliqueStar   normal! zz
autocmd User ObliqueRepeat normal! zz
" }}}
" Airline {{{
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#fnamemod = ':~'
let g:airline#extensions#tabline#fnamecollapse = 1
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
let g:dbext_default_profile_PG = 'type=PGSQL:user=jacques:passwd=:dbname=energyai_development'
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
" youcompleteme {{{
let g:python_host_prog='/usr/bin/python2.7'
let g:ycm_path_to_python_interpreter='/usr/bin/python2.7'
" let g:ycm_path_to_python_interpreter='/Users/jacques/anaconda/bin/python'
"

let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments = 1

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
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
let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

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
    return ""
endfunction

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Expand snippet or return
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction

" Set <space> as primary trigger
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>


" }}}
" pandoc {{{
nnoremap <Leader>c :Pandoc --webtex html<CR>
" }}}
" gitgutter {{{
" nnoremap <Leader>hp <NOP>
let g:gitgutter_signs = 0
nnoremap  <Space><Space>hp     <Plug>GitGutterPreviewHunk
nnoremap  <Space><Space>hr     <Plug>GitGutterRevertHunk
nnoremap  <Space><Space>hs     <Plug>GitGutterStageHunk
" }}}
" showmotion {{{
" nnoremap <Leader>hp <NOP>
" nmap  <silent> w <Plug>(show-motion-both-w)
" }}}
" vim-after-object {{{
autocmd VimEnter * call after_object#enable('=', '#')
" }}}
" vim-operator-surround {{{

" operator mappings
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
  return "\<esc>:let &hlsearch=&hlsearch\<cr>" . v:operator . "gn"
endfunction

function! s:match_visual()
  let reg = @@
  normal! gvy
  let @/ = '\V' . escape(@@, '\')
  let @@ = reg
endfunction

onoremap <expr> <Plug>(gn-next) <SID>gn_next()

nmap <Plug>(quick-replace) :let @/ = '\V\<' . escape(expand('<cword>'), '\') . '\>'<cr>c<Plug>(gn-next)
xmap <Plug>(quick-replace) :<c-u>call <SID>match_visual()<cr>c<Plug>(gn-next)

nmap <leader>f <Plug>(quick-replace)
xmap <leader>f <Plug>(quick-replace)
" }}}

nnoremap <Leader>d :ll!<CR>
let g:lt_location_list_toggle_map = '<leader>o'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" vim: fdm=marker
