if has('vim_starting')
  set nocompatible               " be iMproved
  filetype on                    " required!: filetype detection
  filetype off                   " required!: filetype detection

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'  " let NeoBundle manage itself

NeoBundle 'airblade/vim-gitgutter'                             " sublime-inspired git gutter
NeoBundle 'airblade/vim-rooter'                                " automatic working directory update
NeoBundle 'bling/vim-airline'                                  " light version of powerline
NeoBundle 'DeleteTrailingWhitespace'                           " remove trailing whitespaces
NeoBundle 'dag/vim-fish'                                       " fish syntax highlighting
NeoBundle 'fisadev/vim-ctrlp-cmdpalette'                       " fuzzy command search
NeoBundle 'godlygeek/tabular'                                  " better alignment
NeoBundle 'henrik/vim-qargs'                                   " perform operations on quick list
NeoBundle 'jgdavey/vim-blockle'                                " switch between Ruby blocks
NeoBundle 'jistr/vim-nerdtree-tabs'                            " keep NERDTree open in tabs
NeoBundle 'kchmck/vim-coffee-script'                           " CoffeeScript support
NeoBundle 'kien/ctrlp.vim'                                     " fuzzy file search
NeoBundle 'kshenoy/vim-signature'                              " highlight position of marks
NeoBundle 'Lokaltog/vim-easymotion'                            " quick navigation on text
NeoBundle 'markcornick/vim-vagrant'                            " integration with vagrant
NeoBundle 'mattn/gist-vim', { 'depends': 'mattn/webapi-vim' }  " integration with Gist
NeoBundle 'oguzbilgic/sexy-railscasts-theme'                   " railscasts but sexy
NeoBundle 'p0deje/vim-numbertoggle'                            " relative numbers
NeoBundle 'ProportionalResize', { 'depends': 'ingo-library' }  " autoresize splits
NeoBundle 'Townk/vim-autoclose'                                " autoclose quotes, brackets, etc
NeoBundle 'rking/ag.vim'                                       " integration with Ag
NeoBundle 'rodjek/vim-puppet'                                  " puppet support
NeoBundle 'scrooloose/nerdtree'                                " project tree navigation
NeoBundle 'sgur/ctrlp-extensions.vim'                          " ctrlp extensions
NeoBundle 'Shougo/vimproc'                                     " recommended to install with NeoBundle
NeoBundle 'taiansu/nerdtree-ag'                                " search folder from NERDTree
NeoBundle 'terryma/vim-multiple-cursors'                       " sublime-inspired multiple cursors
NeoBundle 'tpope/vim-abolish'                                  " coercion (case converting)
NeoBundle 'tpope/vim-bundler'                                  " integration with ruby bundler
NeoBundle 'tpope/vim-commentary'                               " comment and uncomment
NeoBundle 'tpope/vim-cucumber'                                 " integration with cucumber
NeoBundle 'tpope/vim-endwise'                                  " automatically end structures
NeoBundle 'tpope/vim-fugitive'                                 " integration with Git
NeoBundle 'tpope/vim-rails'                                    " integration with rails
NeoBundle 'tpope/vim-surround'                                 " surrounds text with quotes, brackets, etc.
NeoBundle 'tpope/vim-unimpaired'                               " used for text bubbling
NeoBundle 'xolox/vim-session', { 'depends': 'xolox/vim-misc' } " session-management for vim

syntax enable       " required!: syntax highlighting
filetype indent on  " required!: filetype-specific indenting
filetype plugin on  " required!: filetype-specific plugins

NeoBundleCheck  " check all bundles on startup

set shell=/bin/bash  " fish is too good for plugins

set guifont=Monaco\ for\ Powerline:h12 " use Monaco support Powerline

let g:airline_left_sep  = ''  " airline separators
let g:airline_right_sep = '◀'  " airline separators

let g:rooter_manual_only = 1  " do not switch CtrlP root

set linespace=1          " increase space between lines
set number               " show line numbers
set cursorline           " highlight current line
set lazyredraw           " faster scrolling
set noswapfile           " no *.swp artifacts
set scrolloff=5          " Keep at least 5 lines visible when scrolling
set nowrap               " Disabled wrapping
set ruler                " show the cursor position all the time
set laststatus=2         " Always display the status line
set showcmd              " display incomplete commands
set autowrite            " Automatically :write before running commands
set exrc                 " enable per-directory .vimrc files
set secure               " disable unsafe commands in local .vimrc files
set history=50           " history size
set foldcolumn=1         " increase vsplits margin
set undofile             " tell it to use an undo file
set undodir=~/.vim/undo  " set a directory to store the undo history

" Indentation
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=2       " BackSpace deletes like most programs in insert mode

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" color scheme settings
colorscheme sexy-railscasts
highlight SignColumn guibg=#222222
highlight FoldColumn guibg=#222222
highlight LineNr guifg=#666666 guibg=#222222

" Search tweaks
set hlsearch
set incsearch
highlight Search guibg=DarkYellow

" Get off my lawn
nnoremap <Left>  :echoe "Use h"<Cr>
nnoremap <Right> :echoe "Use l"<Cr>
nnoremap <Up>    :echoe "Use k"<Cr>
nnoremap <Down>  :echoe "Use j"<Cr>

" Ag tweaks
let g:agprg='ag --smart-case --column'
nmap <Leader>ag :Ag!<Space>

" Cursor customization
set guicursor+=n:hor10     " show only horizontal bar in normal mode
set guicursor+=a:blinkon0  " disable blinking

" Enable spelling check
set spell

" Use very magic
nnoremap / /\v
cnoremap %s/ %s/\v

" Use old regexp engine
" This speeds up Ruby syntax highlighting
set regexpengine=1

if has("gui_running")
  " enable Option meta key
  set macmeta

  " remove MacVim scrollbars
  set guioptions-=R
  set guioptions-=r
  set guioptions-=L

  " always show tab bar
  set showtabline=2

  " autosave file on focus lost
  autocmd FocusLost * silent! wa

  " Make MacVim nicer
  set transparency=4
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" highlight custom files
autocmd BufRead,BufNewFile *file set filetype=ruby
autocmd BufRead,BufNewFile *.load set filetype=fish

" Puppet tweaks
autocmd FileType puppet set commentstring=#\ %s

" Autoclose pipe in Ruby
autocmd FileType ruby let b:AutoClosePairs = AutoClose#DefaultPairsModified("|", "")

" Ruby string interpolation
function! s:InsertInterpolation()
  let before = getline('.')[col('^'):col('.')]
  let after  = getline('.')[col('.'):col('$')]
  " check that we're in double-quotes string
  if before =~# '"' && after =~# '"'
    execute "normal! a{}\<Esc>h"
  endif
endfunction
autocmd FileType ruby inoremap <silent> # #<Esc>:call <SID>InsertInterpolation()<Cr>a
autocmd FileType ruby vnoremap <Leader># c#{<C-R>"}<Esc>

" vim session settings
let g:session_autosave        = 'yes'
let g:session_autoload        = 'no'
let g:session_default_to_last = 'yes'

" Disable automatic startup of NERDTree as it collides with session autoload
let g:nerdtree_tabs_open_on_gui_startup = 0

" CtrlP
let g:ctrlp_extensions   = ['yankring']
let g:ctrlp_use_caching  = 1
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" GitGutter
let g:gitgutter_signs = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_modified_removed = '~'

" Gist
let g:gist_clip_command    = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates   = 1
let g:gist_post_private    = 1

" strip trailing whitespaces
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

" Multiple cursors
let g:multi_cursor_exit_from_insert_mode = 0

" NERDTree
let g:NERDTreeWinPos   = 'right'
let g:NERDTreeWinSize  = 50
let NERDTreeIgnore     = ['^tags$', '\.DS_Store$']
let NERDTreeShowHidden = 1

" automatic alignment of | symbol (used in Gherkin) by tabularize plugin
" taken from https://gist.github.com/tpope/287147
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
autocmd FileType cucumber inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<Cr>a

" NERDTree
nmap <Leader>on :NERDTreeTabsToggle<Cr><C-w>=
nmap <Leader>of :NERDTreeFind<Cr><C-w>=

" Copy run test in VM command to system
nmap <Leader>cu :exec "silent !echo -n ve cucumber " . @% . ":" . line(".") . " \| pbcopy"<Cr>
nmap <Leader>sp :exec "silent !echo -n ve rspec " . @% . ":" . line(".") . " \| pbcopy"<Cr>

" Copy Github link
function! GithubUrl()
  let repo = fugitive#repo().config('remote.origin.url')
  let repo = substitute(repo, '^git@github.com:\(.\+\)\.git$', '\1', '')
  let branch = fugitive#head()
  return "https://github.com/" . repo . "/blob/" . branch . "/" . @% . "#L" . line(".")
endfunction
nmap <Leader>gh :exec "silent !echo -n " . shellescape(GithubUrl(), 1) . " \| pbcopy"<Cr>

" CtrlP
nmap <Leader><Tab> :CtrlPBuffer<Cr>
nmap <Leader>pa :CtrlP app<Cr>
nmap <Leader>pf :CtrlP features<Cr>
nmap <Leader>pv :CtrlP vendor<Cr>
nmap <Leader>pc :CtrlPCmdPalette<Cr>
nmap <Leader>pp :CtrlPYankring<Cr>

" Session
nmap <Leader>os :OpenSession!<Space>
nmap <Leader>ss :exe 'SaveSession! ' .split(getcwd(), '/')[-1]<Cr>

" Window navigation
nmap <M-h> <C-w>h
nmap <M-j> <C-w>j
nmap <M-k> <C-w>k
nmap <M-l> <C-w>l
nmap <M-H> <C-w>H
nmap <M-J> <C-w>J
nmap <M-K> <C-w>K
nmap <M-L> <C-w>L

" Close tab
nmap <M-w> :tabclose<Cr>

" Better splits
nmap <Leader>hs :split<Cr>
nmap <Leader>vs :vsplit<Cr>

" Git
nmap <Leader>gs :Gstatus<Cr>
nmap <Leader>gc :Gcommit<Cr>O
function! GitDiff()
  tabnew
  0read !git diff && git diff --cached
  set filetype=diff
  exe 'write! /tmp/' . split(getcwd(), '/')[-1] . '.diff'
endfunction
nmap <Leader>gd :call GitDiff()<Cr>gg

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Bubble lines
nmap <C-M-k> [e
nmap <C-M-j> ]e
vmap <C-M-k> [egv
vmap <C-M-j> ]egv

" Clear search
nmap <silent> <Leader>cs :let @/ = ""<Cr>

" Cucumber goodness
nmap <Leader>gi ^ciwGiven<Esc>
nmap <Leader>wh ^ciwWhen<Esc>
nmap <Leader>th ^ciwThen<Esc>
nmap <Leader>an ^ciwAnd<Esc>

" Tabular
nmap <Leader>t: :Tab /\w:\zs/l0l1<Cr>
nmap <Leader>t<Bar> :Tab /<Bar><Cr>

" Select inside regex start and end of line
vnoremap ir :<C-U>silent! normal! [z^f^lvt$]z<CR>
omap af :normal Vir<CR>
