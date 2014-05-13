if has('vim_starting')
  set nocompatible               " be iMproved
  filetype on                    " required!: filetype detection
  filetype off                   " required!: filetype detection

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'  " let NeoBundle manage itself

NeoBundle 'airblade/vim-gitgutter'                                                 " sublime-inspired git gutter
NeoBundle 'airblade/vim-rooter'                                                    " automatic working directory update
NeoBundle 'bling/vim-airline'                                                      " light version of powerline
NeoBundle 'DeleteTrailingWhitespace'                                               " remove trailing whitespaces
NeoBundle 'dag/vim-fish'                                                           " fish syntax highlighting
NeoBundle 'fisadev/vim-ctrlp-cmdpalette'                                           " fuzzy command search
NeoBundle 'godlygeek/tabular'                                                      " better alignment
NeoBundle 'gcmt/wildfire.vim'                                                      " select closes text object
NeoBundle 'gcmt/tube.vim'                                                          " integration with iTerm
NeoBundle 'henrik/vim-qargs'                                                       " perform operations on quick list
NeoBundle 'honza/vim-snippets'                                                     " shippets
NeoBundle 'JazzCore/ctrlp-cmatcher'                                                " faster and better matcher for CtrlP
NeoBundle 'jgdavey/vim-blockle'                                                    " switch between Ruby blocks
NeoBundle 'jistr/vim-nerdtree-tabs'                                                " keep NERDTree open in tabs
NeoBundle 'kchmck/vim-coffee-script'                                               " CoffeeScript support
NeoBundle 'kien/ctrlp.vim'                                                         " fuzzy file search
NeoBundle 'kshenoy/vim-signature'                                                  " highlight position of marks
NeoBundle 'Lokaltog/vim-easymotion'                                                " quick navigation on text
NeoBundle 'markcornick/vim-vagrant'                                                " integration with vagrant
NeoBundle 'mattn/gist-vim', { 'depends': 'mattn/webapi-vim' }                      " integration with Gist
NeoBundle 'mhinz/vim-startify'                                                     " startup screen
NeoBundle 'nelstrom/vim-textobj-rubyblock', { 'depends': 'kana/vim-textobj-user' } " ruby block text-object
NeoBundle 'noprompt/vim-yardoc'                                                    " YARD highlighting
NeoBundle 'oguzbilgic/sexy-railscasts-theme'                                       " railscasts but sexy
NeoBundle 'p0deje/vim-numbertoggle'                                                " relative numbers
NeoBundle 'p0deje/vim-ruby-interpolation'                                          " ruby string interpolation
NeoBundle 'jiangmiao/auto-pairs'                                                   " autoclose quotes, brackets, etc
NeoBundle 'rking/ag.vim'                                                           " integration with Ag
NeoBundle 'rodjek/vim-puppet'                                                      " puppet support
NeoBundle 'scrooloose/nerdtree'                                                    " project tree navigation
NeoBundle 'scrooloose/syntastic'                                                   " syntax checking
NeoBundle 'SirVer/ultisnips'                                                       " snippets
NeoBundle 'Shougo/vimproc'                                                         " recommended to install with NeoBundle
NeoBundle 'skalnik/vim-vroom', { 'depends': 'tpope/vim-dispatch' }                 " ruby test runner
NeoBundle 'taiansu/nerdtree-ag'                                                    " search folder from NERDTree
NeoBundle 't9md/vim-choosewin'                                                     " interactive panes switching
NeoBundle 'terryma/vim-multiple-cursors'                                           " sublime-inspired multiple cursors
NeoBundle 'tpope/vim-abolish'                                                      " coercion (case converting)
NeoBundle 'tpope/vim-bundler'                                                      " integration with ruby bundler
NeoBundle 'tpope/vim-commentary'                                                   " comment and uncomment
NeoBundle 'tpope/vim-cucumber'                                                     " integration with cucumber
NeoBundle 'tpope/vim-endwise'                                                      " automatically end structures
NeoBundle 'tpope/vim-fugitive'                                                     " integration with Git
NeoBundle 'tpope/vim-rails'                                                        " integration with rails
NeoBundle 'tpope/vim-repeat'                                                       " support . for plugins
NeoBundle 'tpope/vim-surround'                                                     " surrounds text with quotes, brackets, etc.
NeoBundle 'tpope/vim-unimpaired'                                                   " used for text bubbling
NeoBundle 'vim-ruby/vim-ruby'                                                      " use latest vim-ruby
NeoBundle 'wellle/targets.vim'                                                     " improved text objects
NeoBundle 'YankRing.vim'                                                           " clipboard history
NeoBundle 'Yggdroot/indentLine'                                                    " indentation guides
NeoBundle 'xolox/vim-session', { 'depends': 'xolox/vim-misc' }                     " session-management for vim

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
set wildmenu             " better completion for cmd mode

" Indentation
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=2
let g:indentLine_char = '│'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" color scheme settings
colorscheme sexy-railscasts
highlight SignColumn guibg=#222222
highlight FoldColumn guibg=#222222
highlight LineNr guifg=#666666 guibg=#222222
highlight link yardGenericTag rubyMethodExceptional

" Search tweaks
set hlsearch
set incsearch
highlight Search guibg=DarkYellow

" Let's not be retarded
let mapleader = ','

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
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Puppet tweaks
autocmd FileType puppet set commentstring=#\ %s

" Autoclose pipe in Ruby
autocmd FileType ruby
  \ let b:AutoPairs = g:AutoPairs |
  \ let b:AutoPairs['|'] = '|'

" vim session settings
let g:session_autosave        = 'yes'
let g:session_autoload        = 'no'
let g:session_default_to_last = 'yes'
let g:session_autosave_periodic = 3
nnoremap <Leader>os :OpenSession!<Space>
nnoremap <Leader>ss :exe 'SaveSession! ' . split(getcwd(), '/')[-1]<Cr>

" Startify
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_list_order = [
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Recent files:'],
  \ 'files',
  \ ['   Recent files in current directory:'],
  \ 'dir',
\ ]

" CtrlP
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_match_func  = {'match' : 'matcher#cmatch'}
let g:ctrlp_user_command = 'ag %s --files-with-matches --nocolor -g ""'
nmap <Tab> :CtrlP<Cr>
nmap cp :CtrlPCmdPalette<Cr>

" YankRing
let g:yankring_history_dir = '~/.vim/history'
let g:yankring_replace_n_pkey = '<M-p>'
let g:yankring_replace_n_nkey = '<M-n>'
nnoremap <silent> <Leader>p :YRShow<Cr>

" GitGutter
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_eager = 1

" ChooseWin
let g:choosewin_overlay_enable = 1
let g:choosewin_statusline_replace = 0
nmap <Space> <Plug>(choosewin)

let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" better colors for GitGutter
highlight clear DiffAdd " make sure syntax highlighting is on
highlight DiffAdd guibg=#0B240A
highlight DiffChange guibg=#362F18
highlight DiffDelete guibg=#260000

let g:vroom_use_bundle_exec = 1
let g:vroom_use_dispatch = 1
let g:vroom_cucumber_path = 'cucumber'
let g:dispatch_compilers = {
  \ 'bundle exec rspec': 'rspec',
  \ 'bundle exec cucumber': 'cucumber',
  \ 'bundle exec rake': 'rake'
\ }

" Gist
let g:gist_clip_command    = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates   = 1
let g:gist_post_private    = 1

" strip trailing whitespaces
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

" NERDTree
let g:NERDTreeWinPos   = 'right'
let g:NERDTreeWinSize  = 40
let NERDTreeIgnore     = ['^tags$', '\.DS_Store$']
let NERDTreeShowHidden = 1
let g:nerdtree_tabs_smart_startup_focus = 2

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
nmap <silent> <Leader>on :NERDTreeTabsToggle<Cr><C-w>=
nmap <silent> <Leader>of :NERDTreeFind<Cr><C-w>=

" Disable terrible Ex mode
nnoremap Q <nop>

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
nmap <Bar> :vsplit<Cr>

" Git
function! GitDiff()
  tabnew
  0read !git diff && git diff --cached
  set filetype=diff
  exe 'silent! write! /tmp/' . split(getcwd(), '/')[-1] . '.diff'
  normal! gg
endfunction
command! Gpatch :call GitDiff()
command! -nargs=* Gpush :Git push <args>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Bubble lines
nmap <C-M-k> [e
nmap <C-M-j> ]e
vmap <C-M-k> [egv
vmap <C-M-j> ]egv

" Clear search
nmap <silent> c/ :let @/ = ""<Cr>

" Cucumber goodness
nmap <Leader>gi ^ciwGiven<Esc>
nmap <Leader>wh ^ciwWhen<Esc>
nmap <Leader>th ^ciwThen<Esc>
nmap <Leader>an ^ciwAnd<Esc>
nmap <Leader>sv :vsplit<Cr><C-]>
nmap <Leader>sh <C-w><C-]>

" Tabular
nmap <Leader>t: :Tab /\w:\zs/l0l1<Cr>
nmap <Leader>t<Bar> :Tab /<Bar><Cr>

" Stop using arrows in command mode
cmap <C-h> <Left>
cmap <C-l> <Right>
cmap <C-k> <Up>
cmap <C-j> <Down>

" Select inside regex start and end of line
vnoremap ix :<C-U>silent! normal! ^f^lvt$<Cr>
omap ix :normal Vix<Cr>


" Copy various stuff

function! s:Pbcopy(string)
  call system('echo -n ' . shellescape(a:string) . ' | pbcopy')
  echo "Copied: " . a:string
endfunction

function! s:RelativeFilePath()
  let l:full_path = expand('%')
  let l:directory = expand('%:h')
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


" Ag motions
" Stolen from http://vimbits.com/bits/153 and slightly modified

nnoremap <silent> <Leader>a :set opfunc=<SID>AgMotion<Cr>g@
xnoremap <silent> <Leader>a :<C-U>call <SID>AgMotion(visualmode())<Cr>

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
