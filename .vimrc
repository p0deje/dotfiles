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
NeoBundle 'AndrewRadev/splitjoin.vim', {'lazy': 1, 'mappings': ['gJ', 'gS']}
NeoBundle 'AndrewRadev/switch.vim', {'lazy': 1, 'commands': 'Switch'}
NeoBundle 'AndrewRadev/linediff.vim', {'lazy': 1, 'commands': 'Linediff'}
NeoBundle 'bling/vim-airline'
NeoBundle 'bogado/file-line'
NeoBundle 'DeleteTrailingWhitespace'
NeoBundle 'dhruvasagar/vim-table-mode', {'lazy': 1, 'filetypes': 'cucumber'}
NeoBundle 'dag/vim-fish'
NeoBundle 'gorkunov/smartpairs.vim'
NeoBundle 'henrik/vim-qargs', {'lazy': 1, 'filetypes': 'qf'}
NeoBundle 'JazzCore/ctrlp-cmatcher'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'junegunn/vim-easy-align', {'lazy': 1, 'mappings': '<Plug>(EasyAlign)'}
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'majutsushi/tagbar', {'lazy': 1, 'commands': 'Tagbar'}
NeoBundle 'mattn/gist-vim', {'commands': 'Gist', 'depends': 'mattn/webapi-vim'}
NeoBundle 'mhinz/vim-startify'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'nelstrom/vim-textobj-rubyblock', {'lazy': 1, 'filetypes': 'ruby', 'depends': 'kana/vim-textobj-user'}
NeoBundle 'noprompt/vim-yardoc'
NeoBundle 'p0deje/vim-numbertoggle'
NeoBundle 'p0deje/vim-ruby-interpolation'
NeoBundle 'qstrahl/vim-dentures'
NeoBundle 'rking/ag.vim'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'schickling/vim-bufonly', {'lazy': 1, 'commands': 'Bonly'}
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplete.vim', {'lazy': 1, 'insert': 1}
NeoBundle 'Shougo/neosnippet.vim', {'lazy': 1, 'insert': 1, 'depends': 'Shougo/neosnippet-snippets'}
NeoBundle 'Shougo/vimproc', {'build': {'mac': 'make -f make_mac.mak'}}
NeoBundle 'sjl/gundo.vim', {'lazy': 1, 'commands': 'GundoToggle'}
NeoBundle 'skalnik/vim-vroom', {'depends': 'tpope/vim-dispatch'}
NeoBundle 'slim-template/vim-slim'
NeoBundle 'svermeulen/vim-easyclip', 'develop', {'depends': 'tpope/vim-repeat'}
NeoBundle 'taiansu/nerdtree-ag', {'lazy': 1, 'filetypes': 'nerdtree'}
NeoBundle 't9md/vim-choosewin', {'lazy': 1, 'mappings': '<Plug>'}
NeoBundle 'kristijanhusak/vim-multiple-cursors'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'tommcdo/vim-fugitive-blame-ext', {'lazy': 1, 'filetypes': 'fugitiveblame'}
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-commentary', {'lazy': 1, 'mappings': 'gc'}
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-endwise', {'lazy': 1, 'filetypes': 'ruby'}
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-rbenv'
NeoBundle 'tpope/vim-surround', {'lazy': 1, 'mappings': [['n', 'cs'], ['n', 'ds'], ['n', 'ys'], ['n', 'yS'], ['v', 'S']]}
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

" % support
runtime macros/matchit.vim

" better completion for cmd mode
set wildmenu
set wildignorecase
set wildmode=longest,full

if has('gui_macvim')
  set macmeta
  set clipboard=unnamed
  set guioptions-=R
  set guioptions-=r
  set guioptions-=L
  set showtabline=2
  set transparency=2
  autocmd FocusLost * silent! wa
endif


" Plugin options {{{1
" -------------------

if neobundle#tap('vim-colors-solarized')
  let g:solarized_contrast = "high"
  let g:solarized_hitrail = 1
  let g:solarized_visibility = "low"

  set background=dark
  colorscheme solarized

  highlight FoldColumn guibg=#002b36
  highlight LineNr guibg=#002b36
  highlight Search guibg=#222222 guifg=Orange
  highlight SignColumn guibg=#002b36
  highlight VertSplit guifg=#073642 guibg=#073642
  highlight WildMenu guifg=Orange

  call neobundle#untap()
endif

if neobundle#tap('ag.vim')
  let g:agprg = 'ag --smart-case --column'

  nnoremap gag :Ag!<Space>

  " Ag operator
  " Taken from http://vimbits.com/bits/153 and slightly modified
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

  call neobundle#untap()
endif

if neobundle#tap('ctrlp.vim') && neobundle#tap('ctrlp-cmatcher')
  let g:ctrlp_switch_buffer = 'Et'
  let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}
  let g:ctrlp_user_command = 'ag %s --files-with-matches --nocolor -g ""'
  let g:ctrlp_map = '<Tab>'
  let g:ctrlp_cmd = 'CtrlPMixed'

  call neobundle#untap()
endif

if neobundle#tap('vim-airline')
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_powerline_fonts = 1

  call neobundle#untap()
endif

if neobundle#tap('vim-startify')
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

  autocmd FileType startify
        \ setlocal buftype= |
        \ setlocal cursorline |
        \ setlocal nospell |

  call neobundle#untap()
endif

if neobundle#tap('syntastic')
  let g:syntastic_ruby_checkers = ['mri', 'rubocop']
  let g:syntastic_java_checkers = []
  let g:syntastic_always_populate_loc_list = 1

  call neobundle#untap()
endif

if neobundle#tap('vim-easymotion')
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_use_smartsign_us = 1

  map <Leader> <Plug>(easymotion-prefix)

  call neobundle#untap()
endif

if neobundle#tap('vim-signify')
  let g:signify_vcs_list = ['git']
  let g:signify_sign_change = '~'

  highlight SignifySignAdd guibg=#002b36 guifg=#579900
  highlight SignifySignChange guibg=#002b36 guifg=#b58900
  highlight SignifySignDelete guibg=#002b36 guifg=#dc322f

  autocmd FocusGained,FocusLost * call sy#util#refresh_windows()

  call neobundle#untap()
endif

if neobundle#tap('vim-vroom') && neobundle#tap('vim-dispatch')
  let g:vroom_clear_screen = 0
  let g:vroom_cucumber_path = 'cucumber'
  let g:vroom_use_bundle_exec = 1
  let g:vroom_use_dispatch = 1
  let g:vroom_binstubs_path = 'bin'

  let g:dispatch_compilers = {
    \ 'bundle exec': '',
    \ 'clear;': '',
  \ }

  call neobundle#untap()
endif

if neobundle#tap('gist-vim')
  let g:gist_clip_command = 'pbcopy'
  let g:gist_detect_filetype = 1
  let g:gist_show_privates = 1
  let g:gist_post_private = 1

  call neobundle#untap()
endif

if neobundle#tap('DeleteTrailingWhitespace')
  let g:DeleteTrailingWhitespace = 1
  let g:DeleteTrailingWhitespace_Action = 'delete'

  call neobundle#untap()
endif

if neobundle#tap('nerdtree') && neobundle#tap('vim-nerdtree-tabs')
  let g:NERDTreeWinSize = 40
  let NERDTreeIgnore = ['^tags$', '\.DS_Store$']
  let NERDTreeShowHidden = 1

  let g:nerdtree_tabs_smart_startup_focus = 2
  let g:nerdtree_tabs_open_on_gui_startup = 0

  call neobundle#untap()
endif

if neobundle#tap('auto-pairs')
  " Clear <M-p> mapping
  let g:AutoPairsShortcutToggle = ''

  " Autoclose pipe in Ruby
  autocmd FileType ruby
        \ let b:AutoPairs = {'|': '|'} |
        \ for key in keys(g:AutoPairs) |
        \   let b:AutoPairs[key] = g:AutoPairs[key] |
        \ endfor

  call neobundle#untap()
endif

if neobundle#tap('vim-signature')
  " Leave "m" for vim-easyclip
  let g:SignatureMap = {'Leader': 'gm'}
  call neobundle#untap()
endif

if neobundle#tap('vim-table-mode')
  let g:table_mode_disable_mappings = 1

  autocmd FileType cucumber :TableModeEnable
  autocmd FileType cucumber command! AlignBars :normal viiE*\|
  autocmd FileType cucumber imap <buffer> <Bar> <Plug>(table-mode-tableize)

  call neobundle#untap()
endif

if neobundle#tap('vim-projectionist')
  let g:projectionist_heuristics = {
    \ "features/*": {
    \   "features/*.feature": {"type": "feature", "alternate": "features/step_definitions/{}_steps.rb"},
    \   "features/support/env.rb": {"type": "feature", "alternate": "features/support/hooks.rb"},
    \   "features/step_definitions": {"type": "step"},
    \   "features/step_definitions/*_steps.rb": {"type": "step", "alternate": "features/{}.feature"}
    \ }
  \ }

  " quickly switch between E/S/V/T commands
  cnoremap <C-e> <C-b><Del>E<C-e>
  cnoremap <C-s> <C-b><Del>S<C-e>
  cnoremap <C-v> <C-b><Del>V<C-e>
  cnoremap <C-t> <C-b><Del>T<C-e>

  call neobundle#untap()
endif

if neobundle#tap('gundo.vim')
  let g:gundo_right = 1
  call neobundle#untap()
endif

if neobundle#tap('vim-easyclip')
  let g:EasyClipAutoFormat = 1
  let g:EasyClipDoSystemSync = 0

  nmap M m$

  nmap <M-p> <plug>EasyClipSwapPasteForward
  nmap <M-S-p> <plug>EasyClipSwapPasteBackwards

  " Substitute operator
  nmap <silent> gr <plug>SubstituteOverMotionMap
  nmap grr <plug>SubstituteLine
  xmap gr <plug>XEasyClipPaste

  call neobundle#untap()
endif

if neobundle#tap('neocomplete.vim')
  let g:neocomplete#enable_at_startup = 1

  " Complete with <Tab>
  imap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

  call neobundle#untap()
endif

if neobundle#tap('vim-multiple-cursors')
  " Enable/disable completion when multiple cursors are used
  function! Multiple_cursors_before()
    if exists('g:loaded_neocomplete')
      exe 'NeoCompleteLock'
    endif
  endfunction
  function! Multiple_cursors_after()
    if exists('g:loaded_neocomplete')
      silent exe 'NeoCompleteUnlock'
    endif
  endfunction

  call neobundle#untap()
endif

if neobundle#tap('vim-choosewin')
  nmap <Space> <Plug>(choosewin)
  call neobundle#untap()
endif

if neobundle#tap('vim-easy-align')
  vmap E <Plug>(EasyAlign)
  call neobundle#untap()
endif

if neobundle#tap('vim-fugitive')
  nnoremap gst :Gstatus<Cr>
  call neobundle#untap()
endif

if neobundle#tap('neosnippet.vim')
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)

  call neobundle#untap()
endif

if neobundle#tap('vim-unimpaired')
  " Bubble lines
  nmap <C-M-k> [e
  nmap <C-M-j> ]e
  vmap <C-M-k> [egv
  vmap <C-M-j> ]egv

  call neobundle#untap()
endif

if neobundle#tap('vim-surround')
  autocmd FileType ruby let b:surround_{char2nr('r')} = "do \r end"
  call neobundle#untap()
endif

if neobundle#tap('vim-indent-guides')
  let g:indent_guides_default_mapping = 0
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_color_change_percent = 2
  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

  call neobundle#untap()
endif


" Mappings {{{1
" -------------

" Use very magic
nnoremap / /\v
cnoremap %s/ %s/\v

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

" Clear search
nnoremap <silent> <C-L> :let @/ = ""<Cr>

nnoremap Y y$

cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

nnoremap <M-S-Left> <C-W><
nnoremap <M-S-Right> <C-W>>
nnoremap <M-S-Up> <C-W>+
nnoremap <M-S-Down> <C-W>-

vnoremap * y/<C-r>"<Cr>

" don't move on * and #
nnoremap * *<C-O>
nnoremap # #<C-O>

" keep search matches in the middle of the window
nnoremap n nzvzz
nnoremap N Nzvzz

" unimpaired-like mappings for quickfix
nmap <silent> [oq :cwindow<Cr><M-J>
nnoremap <silent> ]oq :cclose<Cr>


" Autocommands {{{1
" -----------------

augroup Filetypes
  autocmd!

  autocmd BufRead,BufNewFile *file set filetype=ruby
  autocmd BufRead,BufNewFile *.load set filetype=fish
  autocmd BufRead,BufNewFile *.ejs set filetype=html
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  autocmd BufNewFile,BufReadPost *.jelly set filetype=xml
  autocmd BufNewFile,BufReadPost .envrc set filetype=sh

  " hit K to get help on current word
  autocmd FileType vim setlocal keywordprg=:help

  autocmd FileType puppet set commentstring=#\ %s

  " inside regexp text object
  " useful for working with Cucumber step definitions
  autocmd FileType ruby
    \ vnoremap <buffer> ix :<C-U>silent! normal! ^f^lv$F$h<Cr>|
    \ omap <buffer> ix :normal Vix<Cr>

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

command! W w
command! Q q
command! WQ wq
command! Wq wq
