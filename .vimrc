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
NeoBundle 'bling/vim-airline'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'DeleteTrailingWhitespace'
NeoBundle 'dag/vim-fish'
NeoBundle 'fisadev/vim-ctrlp-cmdpalette'
NeoBundle 'godlygeek/tabular'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'gcmt/tube.vim'
NeoBundle 'henrik/vim-qargs'
NeoBundle 'honza/vim-snippets'
NeoBundle 'JazzCore/ctrlp-cmatcher'
NeoBundle 'jistr/vim-nerdtree-tabs'
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
NeoBundle 'oguzbilgic/sexy-railscasts-theme'
NeoBundle 'p0deje/vim-numbertoggle'
NeoBundle 'p0deje/vim-ruby-interpolation'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'rking/ag.vim'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Shougo/vimproc'
NeoBundle 'skalnik/vim-vroom', { 'depends': 'tpope/vim-dispatch' }
NeoBundle 'slim-template/vim-slim'
NeoBundle 'taiansu/nerdtree-ag'
NeoBundle 't9md/vim-choosewin'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'wellle/targets.vim'
NeoBundle 'YankRing.vim'
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
set wildmenu             " better completion for cmd mode

" Indentation
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=2

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
  set transparency=4
endif


" Plugin options {{{1
" -------------------

colorscheme sexy-railscasts
highlight SignColumn guibg=#222222
highlight FoldColumn guibg=#222222
highlight LineNr guifg=#666666 guibg=#222222
highlight link yardGenericTag rubyMethodExceptional

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

map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

let g:signify_vcs_list = ['git']
let g:signify_sign_change = '~'
highlight SignifySignAdd guibg=#222222 guifg=#11BF02
highlight SignifySignChange guibg=#222222 guifg=#BF8602
highlight SignifySignDelete guibg=#222222 guifg=#BF0202

let g:vroom_use_bundle_exec = 1
let g:vroom_use_dispatch = 1
let g:vroom_cucumber_path = 'cucumber'
let g:dispatch_compilers = {
  \ 'bundle exec rspec': 'rspec',
  \ 'bundle exec cucumber': 'cucumber',
  \ 'bundle exec rake': 'rake'
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


" Mappings {{{1
" -------------

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
nnoremap <silent> c/ :let @/ = ""<Cr>

nnoremap <Leader>t: :Tab /\w:\zs/l0l1<Cr>
nnoremap <Leader>t<Bar> :Tab /<Bar><Cr>

cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

vnoremap ix :<C-U>silent! normal! ^f^lvt$<Cr>
omap ix :normal Vix<Cr>

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
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

  autocmd FileType puppet set commentstring=#\ %s

  " Autoclose pipe in Ruby
  autocmd FileType ruby
    \ let b:AutoPairs = {'|': '|'} |
    \ for key in keys(g:AutoPairs) |
    \   let b:AutoPairs[key] = g:AutoPairs[key] |
    \ endfor

  " automatic alignment of | symbol (used in Gherkin) by Tabularize plugin
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
  autocmd FileType cucumber
    \ inoremap <buffer> <silent> <Bar> <Bar><Esc>:call <SID>align()<Cr>a |
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

function! s:GitDiff()
  tabnew
  0read !git diff && git diff --cached
  set filetype=diff
  exe 'silent! write! /tmp/' . split(getcwd(), '/')[-1] . '.diff'
  normal! gg
endfunction
command! Gpatch :call <SID>GitDiff()
command! -nargs=* Gpush :Git push <args>

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

function! s:CopyGithubLink()
  let l:repo = fugitive#repo().config('remote.origin.url')
  let l:repo = substitute(repo, '^git@github.com:\(.\+\)\.git$', '\1', '')
  let l:branch = fugitive#head()
  let l:path = <SID>RelativeFilePath()
  call <SID>Pbcopy("https://github.com/" . l:repo . "/blob/" . l:branch . "/" . l:path . "#L" . line("."))
endfunction
command! CopyGithubLink :call <SID>CopyGithubLink()
