" ~/.vimrc

" Plugins management {{{1
" -----------------------

if has('vim_starting')
  set nocompatible               " be iMproved
  filetype on                    " required!: filetype detection
  filetype off                   " required!: filetype detection

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'airblade/vim-rooter'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'DeleteTrailingWhitespace'
NeoBundle 'p0deje/vim-table-mode'
NeoBundle 'dag/vim-fish'
NeoBundle 'fisadev/vim-ctrlp-cmdpalette'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'gcmt/tube.vim'
NeoBundle 'henrik/vim-qargs'
NeoBundle 'honza/vim-snippets'
NeoBundle 'JazzCore/ctrlp-cmatcher'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'markcornick/vim-vagrant'
NeoBundle 'mattn/gist-vim', { 'depends': 'mattn/webapi-vim' }
NeoBundle 'mhinz/vim-startify'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'nelstrom/vim-textobj-rubyblock', { 'depends': 'kana/vim-textobj-user' }
NeoBundle 'noprompt/vim-yardoc'
NeoBundle 'p0deje/vim-numbertoggle'
NeoBundle 'p0deje/vim-ruby-interpolation'
NeoBundle 'qstrahl/vim-dentures'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'rking/ag.vim'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Shougo/vimproc', { 'build': { 'mac': 'make -f make_mac.mak' } }
NeoBundle 'sjl/gundo.vim'
NeoBundle 'skalnik/vim-vroom', { 'depends': 'tpope/vim-dispatch' }
NeoBundle 'slim-template/vim-slim'
NeoBundle 'svermeulen/vim-easyclip', 'develop', { 'depends': 'tpope/vim-repeat' }
NeoBundle 'taiansu/nerdtree-ag'
NeoBundle 't9md/vim-choosewin'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'tommcdo/vim-fugitive-blame-ext'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'wellle/targets.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'xolox/vim-session', { 'depends': 'xolox/vim-misc' }

syntax enable       " required!: syntax highlighting
filetype indent on  " required!: filetype-specific indenting
filetype plugin on  " required!: filetype-specific plugins

NeoBundleCheck


" Vim options {{{1
" ----------------

set shell=/bin/bash  " fish is too good for plugins

set guifont=Monaco\ for\ Powerline:h12

set linespace=1          " increase space between lines
set number               " show line numbers
set cursorline           " highlight current line
set lazyredraw           " faster scrolling
set noswapfile           " no *.swp artifacts
set scrolloff=10         " Keep at least 10 lines visible when scrolling
set nowrap               " Disabled wrapping
set ruler                " show the cursor position all the time
set laststatus=2         " Always display the status line
set showcmd              " display incomplete commands
set autowrite            " Automatically :write before running commands
set autoread             " Automatically reload changed files
set exrc                 " enable per-directory .vimrc files
set secure               " disable unsafe commands in local .vimrc files
set history=50           " history size
set foldcolumn=1         " increase vsplits margin
set undofile             " tell it to use an undo file
set undodir=~/.vim/undo  " set a directory to store the undo history
set wildmenu             " better completion for cmd mode

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Search tweaks
set hlsearch
set incsearch
highlight Search guibg=#222222 guifg=Orange

" Let's not be retarded
let mapleader = ','

" Cursor customization
set guicursor+=n:hor10     " show only horizontal bar in normal mode
set guicursor+=a:blinkon0  " disable blinking

" Enable spelling check
set spell

" Use old regexp engine
" This speeds up Ruby syntax highlighting
set regexpengine=1

" % support
runtime macros/matchit.vim

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
  set transparency=2
endif


" Plugin options {{{1
" -------------------

set background=dark
let g:solarized_contrast = "high"
let g:solarized_hitrail = 1
let g:solarized_visibility = "low"
colorscheme solarized

highlight SignColumn guibg=#002b36
highlight FoldColumn guibg=#002b36
highlight LineNr guibg=#002b36
highlight VertSplit guifg=#073642 guibg=#073642

let g:indentLine_char = '│'

let g:agprg='ag --smart-case --column'

let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_match_func  = {'match' : 'matcher#cmatch'}
let g:ctrlp_user_command = 'ag %s --files-with-matches --nocolor -g ""'

let g:airline_left_sep  = ''
let g:airline_right_sep = '◀'

let g:rooter_manual_only = 1  " do not switch CtrlP root

let g:startify_session_dir = '~/.vim/sessions'
let g:startify_list_order = [
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Recent files:'],
  \ 'files',
  \ ['   Recent files in current directory:'],
  \ 'dir',
\ ]

let g:session_autosave = 'yes'
let g:session_autoload = 'no'
let g:session_default_to_last = 'yes'
let g:session_autosave_periodic = 3

let g:yankring_history_dir = '~/.vim/history'
let g:yankring_replace_n_pkey = '<M-p>'
let g:yankring_replace_n_nkey = '<M-n>'

let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_always_populate_loc_list = 1

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

let g:signify_vcs_list = ['git']
let g:signify_sign_change = '~'
highlight SignifySignAdd guibg=#002b36 guifg=#579900
highlight SignifySignChange guibg=#002b36 guifg=#b58900
highlight SignifySignDelete guibg=#002b36 guifg=#dc322f

let g:vroom_use_bundle_exec = 1
let g:vroom_use_dispatch = 1
let g:vroom_cucumber_path = 'cucumber'
let g:dispatch_compilers = {
  \ 'bundle exec': '',
  \ 'clear': '',
\ }

let g:gist_clip_command    = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates   = 1
let g:gist_post_private    = 1

let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

let g:NERDTreeWinPos   = 'right'
let g:NERDTreeWinSize  = 40
let NERDTreeIgnore     = ['^tags$', '\.DS_Store$']
let NERDTreeShowHidden = 1
let g:nerdtree_tabs_smart_startup_focus = 2

" Clear <M-p> mapping
let g:AutoPairsShortcutToggle = ''

" Leave "m" for vim-easyclip
let g:SignatureMap = { 'Leader': 'gm' }

let g:table_mode_disable_mappings = 1

let g:targets_pairs = '()b {}B [] <>a'

" Mappings {{{1
" -------------

map <Leader> <Plug>(easymotion-prefix)

nnoremap <Leader>ag :Ag!<Space>

" Use very magic
nnoremap / /\v
cnoremap %s/ %s/\v

nnoremap <Tab> :CtrlP<Cr>
nnoremap cp :CtrlPCmdPalette<Cr>

nnoremap <silent> <Leader>p :YRShow<Cr>

nmap <Space> <Plug>(choosewin)

nnoremap <silent> <Leader>on :NERDTreeTabsToggle<Cr><C-w>=
nnoremap <silent> <Leader>of :NERDTreeFind<Cr><C-w>=

" Disable terrible Ex mode
nnoremap Q <nop>

nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-H> <C-w>H
nnoremap <M-J> <C-w>J
nnoremap <M-K> <C-w>K
nnoremap <M-L> <C-w>L

nnoremap <M-w> :tabclose<Cr>

nnoremap <Bar> :vsplit<Cr>

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

" Bubble lines
nmap <C-M-k> [e
nmap <C-M-j> ]e
vmap <C-M-k> [egv
vmap <C-M-j> ]egv

" Clear search
nnoremap <silent> <C-L> :let @/ = ""<Cr>

vmap E <Plug>(EasyAlign)

nnoremap Y y$

cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

nnoremap <M-S-Left> <C-W><
nnoremap <M-S-Right> <C-W>>
nnoremap <M-S-Up> <C-W>+
nnoremap <M-S-Down> <C-W>-

nnoremap gst :Gstatus<Cr>

vnoremap * y/<C-r>"<Cr>

" don't move on * and #
nnoremap * *<C-O>
nnoremap # #<C-O>

" keep search matches in the middle of the window
nnoremap n nzvzz
nnoremap N Nzvzz

nmap M m$
nmap <M-p> <plug>EasyClipSwapPasteForward
nmap <M-P> <plug>EasyClipSwapPasteBackwards

imap <Bar> <Plug>(table-mode-tableize)

" Ag motions
" Stolen from http://vimbits.com/bits/153 and slightly modified

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
  execute "normal! :Ag! " . shellescape(@@) . "\<Cr>"
  let @@ = reg_save
endfunction

nnoremap <silent> <Leader>a :set opfunc=<SID>AgMotion<Cr>g@
xnoremap <silent> <Leader>a :<C-U>call <SID>AgMotion(visualmode())<Cr>


" Autocommands {{{1
" -----------------

augroup Filetypes
  autocmd!

  autocmd BufRead,BufNewFile *file set filetype=ruby
  autocmd BufRead,BufNewFile *.load set filetype=fish
  autocmd BufRead,BufNewFile *.ejs set filetype=html
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

  autocmd FileType puppet set commentstring=#\ %s

  " Autoclose pipe in Ruby
  autocmd FileType ruby
    \ let b:AutoPairs = {'|': '|'} |
    \ for key in keys(g:AutoPairs) |
    \   let b:AutoPairs[key] = g:AutoPairs[key] |
    \ endfor

  " Surround improvements
  autocmd FileType ruby
    \ let b:surround_{char2nr('#')} = "#{\r}" |
    \ let b:surround_{char2nr('d')} = "do \r end" |

  " inside regexp text object
  " useful for working with Cucumber step definitions
  autocmd FileType ruby
    \ vnoremap <buffer> ix :<C-U>silent! normal! ^f^lvt$h<Cr> |
    \ omap <buffer> ix :normal Vix<Cr>

  autocmd FileType cucumber :TableModeEnable

  autocmd FileType cucumber
    \ nnoremap <buffer> <Leader>gi ^ciwGiven<Esc> |
    \ nnoremap <buffer> <Leader>wh ^ciwWhen<Esc> |
    \ nnoremap <buffer> <Leader>th ^ciwThen<Esc> |
    \ nnoremap <buffer> <Leader>an ^ciwAnd<Esc> |
augroup END

augroup Misc
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END


" Commands {{{1
" -------------

command! PrettyPrintJson :%!python -m json.tool

" Copy various stuff

function! s:Pbcopy(string)
  call system('echo -n ' . shellescape(a:string) . ' | pbcopy')
  echo "Copied: " . a:string
endfunction

function! s:RelativeFilePath()
  let l:full_path = expand('%')
  let l:directory = getcwd()
  return substitute(l:full_path, l:directory . '/', '', '')
endfunction

function! s:CopyFileLine()
  let l:path = <SID>RelativeFilePath()
  let l:line = line('.')
  call <SID>Pbcopy(l:path . ':' . l:line)
endfunction
command! CopyFileLine :call <SID>CopyFileLine()
