" ~/.vimrc

" Plugins management {{{1
" -----------------------

if has('vim_starting')
  set nocompatible               " be iMproved
  filetype on                    " required!: filetype detection
  filetype off                   " required!: filetype detection

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'airblade/vim-rooter'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundleLazy 'AndrewRadev/splitjoin.vim', {'autoload': {'mappings': ['gJ', 'gS']}}
NeoBundleLazy 'AndrewRadev/switch.vim', {'autoload': {'commands': 'Switch'}}
NeoBundleLazy 'AndrewRadev/linediff.vim', {'autoload': {'commands': 'Linediff'}}
NeoBundle 'bling/vim-airline'
NeoBundle 'bogado/file-line'
NeoBundle 'DeleteTrailingWhitespace'
NeoBundleLazy 'p0deje/vim-table-mode', {'autoload': {'filetypes': 'cucumber'}}
NeoBundle 'dag/vim-fish'
NeoBundleLazy 'henrik/vim-qargs', {'autoload': {'filetypes': 'qf'}}
NeoBundle 'JazzCore/ctrlp-cmatcher'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundleLazy 'junegunn/vim-easy-align', {'autoload': {'mappings': '<Plug>(EasyAlign)'}}
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundleLazy 'majutsushi/tagbar', {'autoload': {'commands': 'Tagbar'}}
NeoBundleLazy 'mattn/gist-vim', {'autoload': {'commands': 'Gist'}, 'depends': 'mattn/webapi-vim'}
NeoBundle 'mhinz/vim-startify'
NeoBundle 'mhinz/vim-signify'
NeoBundleLazy 'nelstrom/vim-textobj-rubyblock', {'autoload': {'filetypes': 'ruby'}, 'depends': 'kana/vim-textobj-user'}
NeoBundleLazy 'noprompt/vim-yardoc', {'autoload': {'filetypes': 'ruby'}}
NeoBundle 'p0deje/vim-numbertoggle'
NeoBundleLazy 'p0deje/vim-ruby-interpolation', {'autoload': {'filetypes': 'ruby'}}
NeoBundle 'qstrahl/vim-dentures'
NeoBundleLazy 'jiangmiao/auto-pairs', {'autoload': {'insert': 1}}
NeoBundleLazy 'rking/ag.vim', {'autoload': {'commands': ['Ag!']}}
NeoBundle 'rodjek/vim-puppet'
NeoBundleLazy 'schickling/vim-bufonly', {'autoload': {'commands': 'BufOnly'}}
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundleLazy 'Shougo/neocomplete.vim', {'autoload': {'insert': 1}}
NeoBundleLazy 'Shougo/neosnippet.vim', {'autoload': {'insert': 1}, 'depends': 'Shougo/neosnippet-snippets'}
NeoBundle 'Shougo/vimproc', {'build': {'mac': 'make -f make_mac.mak'}}
NeoBundleLazy 'sjl/gundo.vim', {'autoload': {'commands': 'GundoToggle'}}
NeoBundle 'skalnik/vim-vroom', {'depends': 'tpope/vim-dispatch'}
NeoBundle 'slim-template/vim-slim'
NeoBundle 'svermeulen/vim-easyclip', 'develop', {'depends': 'tpope/vim-repeat'}
NeoBundleLazy 'taiansu/nerdtree-ag', {'autoload': {'filetypes': 'nerdtree'}}
NeoBundleLazy 't9md/vim-choosewin', {'autoload': {'mappings': '<Space>'}}
NeoBundleLazy 'kristijanhusak/vim-multiple-cursors', {'autoload': {'mappings': '<C-n>'}}
NeoBundle 'tommcdo/vim-exchange'
NeoBundleLazy 'tommcdo/vim-fugitive-blame-ext', {'autoload': {'filetypes': 'fugitiveblame'}}
NeoBundleLazy 'tpope/vim-abolish', {'autoload': {'commands': ['Abolish', '%S']}}
NeoBundle 'tpope/vim-bundler'
NeoBundleLazy 'tpope/vim-commentary', {'autoload': {'mappings': 'gc'}}
NeoBundle 'tpope/vim-cucumber'
NeoBundleLazy 'tpope/vim-endwise', {'autoload': {'filetypes': 'ruby'}}
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-repeat'
NeoBundleLazy 'tpope/vim-surround', {'autoload': {'mappings': ['cs', 'ds', 'ys', 'yS']}}
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'wellle/targets.vim'

call neobundle#end()

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

set ignorecase
set smartcase

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
set guicursor+=a:blinkon0  " disable blinking

" Enable spelling check
set spell

" Use old regexp engine
" This speeds up Ruby syntax highlighting
set regexpengine=1

set sessionoptions-=blank
set sessionoptions-=help
set sessionoptions+=resize
set sessionoptions+=winpos

" % support
runtime macros/matchit.vim

" better completion for cmd mode
set wildmenu
set wildignorecase
set wildmode=full

if has("gui_running")
  " enable Option meta key
  set macmeta

  set clipboard=unnamed

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
highlight WildMenu guifg=Orange

let g:agprg = 'ag --smart-case --column'

let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}
let g:ctrlp_user_command = 'ag %s --files-with-matches --nocolor -g ""'
let g:ctrlp_map = '<Tab>'
let g:ctrlp_cmd = 'CtrlPMixed'

let g:airline_left_sep  = ''
let g:airline_right_sep = '◀'

let g:startify_session_dir = '~/.vim/sessions'
let g:startify_session_persistence = 1
let g:startify_relative_path = 1
let g:startify_list_order = [
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Recent files:'],
  \ 'files',
  \ ['   Recent files in current directory:'],
  \ 'dir',
\ ]

let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_java_checkers = []
let g:syntastic_always_populate_loc_list = 1

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

let g:signify_vcs_list = ['git']
let g:signify_sign_change = '~'
highlight SignifySignAdd guibg=#002b36 guifg=#579900
highlight SignifySignChange guibg=#002b36 guifg=#b58900
highlight SignifySignDelete guibg=#002b36 guifg=#dc322f
autocmd FocusGained,FocusLost * call sy#util#refresh_windows()

let g:vroom_use_bundle_exec = 1
let g:vroom_use_dispatch = 1
let g:vroom_cucumber_path = 'cucumber'
let g:dispatch_compilers = {
  \ 'bundle exec': '',
  \ 'clear': '',
\ }

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 40
let NERDTreeIgnore = ['^tags$', '\.DS_Store$']
let NERDTreeShowHidden = 1
let g:nerdtree_tabs_smart_startup_focus = 2
let g:nerdtree_tabs_open_on_gui_startup = 0

" Clear <M-p> mapping
let g:AutoPairsShortcutToggle = ''

" Leave "m" for vim-easyclip
let g:SignatureMap = {'Leader': 'gm'}

let g:table_mode_disable_mappings = 1

let g:targets_pairs = '()b {}B [] <>a'

let g:projectionist_heuristics = {
  \ "features/*": {
  \   "features": {"type": "feature"},
  \   "features/*.feature": {"type": "feature"},
  \   "features/step_definitions": {"type": "step"},
  \   "features/step_definitions/*_steps.rb": {"type": "step"}
  \ },
  \ "lib/|spec/*": {
  \   "lib/*.rb": {
  \     "type": "lib",
  \     "alternate": "spec/{}_spec.rb"
  \   },
  \   "spec/*_spec.rb": {
  \     "type": "spec",
  \     "alternate": "lib/{}.rb"
  \   }
  \ }
\ }

let g:gundo_right = 1

let g:EasyClipAutoFormat = 1
let g:EasyClipDoSystemSync = 0

let g:neocomplete#enable_at_startup = 1

" Enable/disable completion when multiple cursors are used

function! Multiple_cursors_before()
  exe 'NeoCompleteLock'
endfunction

function! Multiple_cursors_after()
  exe 'NeoCompleteUnlock'
endfunction


" Mappings {{{1
" -------------

map <Leader> <Plug>(easymotion-prefix)

nnoremap gag :Ag!<Space>

" Use very magic
nnoremap / /\v
cnoremap %s/ %s/\v

nnoremap <silent> <Leader>p :YRShow<Cr>

nmap <Space> <Plug>(choosewin)

" Disable terrible Ex mode
nnoremap Q <nop>

nnoremap <silent> <M-h> :wincmd h<Cr>
nnoremap <silent> <M-j> :wincmd j<Cr>
nnoremap <silent> <M-k> :wincmd k<Cr>
nnoremap <silent> <M-l> :wincmd l<Cr>

function! s:DoNERDActionAndResize(action) abort
  if a:action ==# 'Find'
    if !nerdtree#isTreeOpen()
      execute 'NERDTreeTabsOpen'
      execute 'wincmd p'
    endif
    execute 'NERDTreeTabsFind'
  else
    execute 'NERDTreeTabs' . a:action
  endif
  execute 'wincmd ='
endfunction
nnoremap <silent> <Leader>on :call <SID>DoNERDActionAndResize('Toggle')<Cr>
nnoremap <silent> <Leader>of :call <SID>DoNERDActionAndResize('Find')<Cr>

function! s:MoveWindowAndResize(direction) abort
  let l:nerd_open = nerdtree#isTreeOpen()
  if l:nerd_open
    call s:DoNERDActionAndResize('Close')
  endif
  execute 'wincmd ' . a:direction
  if l:nerd_open
    call s:DoNERDActionAndResize('Open')
    execute 'wincmd p'
  endif
endfunction
nnoremap <silent> <M-H> :call <SID>MoveWindowAndResize('H')<Cr>
nnoremap <silent> <M-J> :call <SID>MoveWindowAndResize('J')<Cr>
nnoremap <silent> <M-K> :call <SID>MoveWindowAndResize('K')<Cr>
nnoremap <silent> <M-L> :call <SID>MoveWindowAndResize('L')<Cr>
nnoremap <silent> <M-T> :wincmd T<Cr>

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
nmap <M-S-p> <plug>EasyClipSwapPasteBackwards
" Substitute operator
nmap <silent> gr <plug>SubstituteOverMotionMap
nmap grr <plug>SubstituteLine
xmap gr <plug>XEasyClipPaste

" unimpaired-like mappings for quickfix
nmap <silent> [oq :cwindow<Cr><M-J>
nnoremap <silent> ]oq :cclose<Cr>

" Complete with <Tab>
imap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Expand snippets
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Ag operator
" Stolen from http://vimbits.com/bits/153 and slightly modified
function! s:AgMotion(type) abort
  let reg_save = @@
  if a:type ==# 'v'
    silent execute "normal! `<" . a:type . "`>y"
  elseif a:type ==# 'char'
    silent execute "normal! `[v`]y"
  endif
  execute "normal! :Ag! " . shellescape(@@) . "\<Cr>"
  let @@ = reg_save
endfunction
nnoremap <silent> ga :set opfunc=<SID>AgMotion<Cr>g@
xnoremap <silent> ga :<C-U>call <SID>AgMotion(visualmode())<Cr>


" Autocommands {{{1
" -----------------

augroup Filetypes
  autocmd!

  autocmd BufRead,BufNewFile *file set filetype=ruby
  autocmd BufRead,BufNewFile *.load set filetype=fish
  autocmd BufRead,BufNewFile *.ejs set filetype=html
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  autocmd BufNewFile,BufReadPost *.jelly set filetype=xml

  " hit K to get help on current word
  autocmd FileType vim setlocal keywordprg=:help

  autocmd FileType puppet set commentstring=#\ %s

  " Autoclose pipe in Ruby
  autocmd FileType ruby
    \ let b:AutoPairs = {'|': '|'} |
    \ for key in keys(g:AutoPairs) |
    \   let b:AutoPairs[key] = g:AutoPairs[key] |
    \ endfor

  " Surround improvements
  autocmd FileType ruby let b:surround_{char2nr('d')} = "do \r end"

  " inside regexp text object
  " useful for working with Cucumber step definitions
  autocmd FileType ruby
    \ vnoremap <buffer> ix :<C-U>silent! normal! ^f^lvt$h<Cr> |
    \ omap <buffer> ix :normal Vix<Cr>

  " Cucumber tables sugar
  autocmd FileType cucumber :TableModeEnable
  autocmd FileType cucumber command! AlignBars :normal viiE*\|
  autocmd FileType cucumber imap <buffer> <Bar> <Plug>(table-mode-tableize)

  autocmd FileType cucumber
    \ nnoremap <buffer> <Leader>gi ^ciwGiven<Esc> |
    \ nnoremap <buffer> <Leader>wh ^ciwWhen<Esc> |
    \ nnoremap <buffer> <Leader>th ^ciwThen<Esc> |
    \ nnoremap <buffer> <Leader>an ^ciwAnd<Esc> |

  autocmd FileType startify
    \ setlocal buftype= |
    \ setlocal cursorline |
    \ setlocal nospell |
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

command! W w
command! Q q
command! WQ wq
command! Wq wq
