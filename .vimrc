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
NeoBundle 'AndrewRadev/writable_search.vim', {'lazy': 1, 'commands': ['WritableSearch', 'WritableSearchFromQuickfix']}
NeoBundle 'bling/vim-airline', {'depends': 'vim-airline/vim-airline-themes'}
NeoBundle 'bogado/file-line'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'DeleteTrailingWhitespace'
NeoBundle 'dhruvasagar/vim-table-mode', {'lazy': 1, 'filetypes': 'cucumber'}
NeoBundle 'dag/vim-fish'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'janko-m/vim-test'
NeoBundle 'JazzCore/ctrlp-cmatcher', {'build': {'mac': './install.sh'}}
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'junegunn/gv.vim', {'lazy': 1, 'commands': ['GV', 'GV!'], 'depends': 'tpope/vim-fugitive'}
NeoBundle 'junegunn/limelight.vim', {'lazy': 1, 'commands': 'Limelight'}
NeoBundle 'junegunn/vim-easy-align', {'lazy': 1, 'mappings': '<Plug>(EasyAlign)'}
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'lifepillar/vim-mucomplete'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'luochen1990/rainbow'
NeoBundle 'majutsushi/tagbar', {'lazy': 1, 'commands': 'Tagbar'}
NeoBundle 'mattn/gist-vim', {'lazy': 1, 'commands': 'Gist', 'depends': 'mattn/webapi-vim'}
NeoBundle 'mhinz/vim-startify'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'mtth/scratch.vim'
NeoBundle 'mzlogin/vim-markdown-toc', {'lazy': 1, 'filetypes': 'markdown'}
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'nelstrom/vim-textobj-rubyblock', {'lazy': 1, 'filetypes': 'ruby', 'depends': 'kana/vim-textobj-user'}
NeoBundle 'noprompt/vim-yardoc'
NeoBundle 'osyo-manga/vim-brightest'
NeoBundle 'p0deje/vim-cucumber', {'rev': '_merge'}
NeoBundle 'p0deje/vim-dispatch-vimshell', {'depends': ['tpope/vim-dispatch', 'Shougo/vimshell.vim']}
NeoBundle 'p0deje/vim-numbertoggle'
NeoBundle 'p0deje/vim-ruby-interpolation'
NeoBundle 'PProvost/vim-ps1'
NeoBundle 'qstrahl/vim-dentures'
NeoBundle 'rgrinberg/vim-operator-gsearch', {'depends': ['kana/vim-operator-user', 'rking/ag.vim']}
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'schickling/vim-bufonly', {'lazy': 1, 'commands': 'Bonly'}
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimfiler.vim', {'depends': 'Shougo/unite.vim'}
NeoBundle 'Shougo/vimproc', {'build': {'mac': 'make -f make_mac.mak'}}
NeoBundle 'sjl/gundo.vim', {'lazy': 1, 'commands': 'GundoToggle'}
NeoBundle 'slim-template/vim-slim'
NeoBundle 'svermeulen/vim-easyclip', {'rev': 'develop', 'depends': 'tpope/vim-repeat'}
NeoBundle 't9md/vim-choosewin'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'tommcdo/vim-fugitive-blame-ext', {'lazy': 1, 'filetypes': 'fugitiveblame'}
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-commentary', {'lazy': 1, 'mappings': 'gc'}
NeoBundle 'tpope/vim-endwise', {'lazy': 1, 'filetypes': 'ruby'}
NeoBundle 'tpope/vim-fugitive', {'depends': 'tpope/vim-git'}
NeoBundle 'tpope/vim-haystack'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-rbenv'
NeoBundle 'tpope/vim-scriptease'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'wellle/targets.vim'
NeoBundle 'zimbatm/direnv.vim'

call neobundle#end()

syntax enable       " required!: syntax highlighting
filetype indent on  " required!: filetype-specific indenting
filetype plugin on  " required!: filetype-specific plugins

NeoBundleCheck


" Vim options {{{1
" ----------------

set shell=/bin/bash  " fish is too good for plugins

set guifont=Monaco\ for\ Powerline:h14

set number               " show line numbers
set cursorline           " highlight current line
set lazyredraw           " faster scrolling
set noswapfile           " no *.swp artifacts
set scrolloff=10         " Keep at least 10 lines visible when scrolling
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
set virtualedit=block
set hidden
set shiftwidth=2
set modeline

let &colorcolumn=join(range(81, 999), ',')

" Line wrapping
set wrap
set linebreak
set breakindent

set ignorecase
set smartcase

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Search tweaks
set hlsearch

" Let's not be retarded
let g:mapleader = ','

" Cursor customization
set guicursor+=a:blinkon0  " disable blinking

" Enable spelling check
set spell

" Use old regexp engine
" This speeds up Ruby syntax highlighting
set regexpengine=1

set sessionoptions-=blank

" % support
runtime macros/matchit.vim

" better completion for cmd mode
set wildmenu
set wildignorecase
set wildignore=*.pyc
set wildmode=longest,full

" completion improvements
set completeopt+=menu,menuone
set shortmess+=c

let g:markdown_fenced_languages = [
      \ 'cucumber',
      \ 'ruby',
      \ 'sh',
      \ 'bash=sh',
      \ ]

if has('gui_macvim')
  set macmeta
  set clipboard=unnamed
  set guioptions-=R
  set guioptions-=r
  set guioptions-=L
  set showtabline=2
  set transparency=2
endif

" Containers for functions
let configure = {}
let helpers = {}

" remove comment marker when joining lines
set formatoptions+=j


" Plugin options {{{1
" -------------------

if neobundle#tap('vim-colors-solarized')
  let g:solarized_contrast = 'high'
  let g:solarized_visibility = 'low'

  let current_time = strftime('%H:%M:%S.0 %z')
  if current_time < '20:00:00.0' || current_time > '8:00:00.0'
    set background=light
  else
    set background=dark
  endif

  colorscheme solarized

  highlight Search guibg=#222222 guifg=Orange
  if &background ==# 'dark'
    highlight FoldColumn guibg=#002b36
    highlight LineNr guibg=#002b36
    highlight SignColumn guibg=#002b36
    highlight VertSplit guifg=#073642 guibg=#073642
    highlight WildMenu guifg=Orange
  else
    highlight FoldColumn guibg=#fdf6e3
    highlight LineNr guibg=#fdf6e3
    highlight SignColumn guibg=#fdf6e3
    highlight VertSplit guifg=#eee8d5 guibg=#eee8d5
    highlight WildMenu guifg=#fdf6e3 guibg=Black
    highlight CursorLineNr guibg=#eee8d5
  endif

  call neobundle#untap()
endif

if neobundle#tap('vim-operator-gsearch')
  let g:gsearch_ag_command = 'Ag!'

  map ga <Plug>(operator-ag)
  nnoremap ga<Space> :Ag!<Space>
  nnoremap <silent> gac :execute 'Ag! ' . shellescape(@+)<Cr>

  call neobundle#untap()
endif

if neobundle#tap('ctrlp.vim') && neobundle#tap('ctrlp-cmatcher')
  let g:ctrlp_switch_buffer = 'Et'
  let g:ctrlp_match_func = {'match': 'matcher#cmatch'}
  let g:ctrlp_user_command = 'ag %s --files-with-matches --nocolor -g ""'
  let g:ctrlp_map = '<C-p>'
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

  autocmd FileType startify call configure.startify()
  function! configure.startify()
    setlocal buftype=
    setlocal cursorline
    setlocal nospell

    nmap <buffer> l <Enter>
    nmap <buffer> o <Enter>
  endfunction

  call neobundle#untap()
endif

if neobundle#tap('syntastic')
  let g:syntastic_ruby_checkers = ['mri', 'rubocop']
  let g:syntastic_java_checkers = []
  let g:syntastic_sh_checkers = ['sh', 'shellcheck']
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_ruby_rubocop_args = '--display-cop-names'

  " Disable checkers for schema
  autocmd BufNewFile,BufReadPost schema.rb let b:syntastic_skip_checks = 1

  call neobundle#untap()
endif

if neobundle#tap('vim-easymotion')
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_use_smartsign_us = 1

  map gj <Plug>(easymotion-s2)

  call neobundle#untap()
endif

if neobundle#tap('vim-signify')
  let g:signify_vcs_list = ['git']
  let g:signify_sign_change = '~'

  if &background ==# 'dark'
    highlight SignifySignAdd guibg=#002b36 guifg=#579900
    highlight SignifySignChange guibg=#002b36 guifg=#b58900
    highlight SignifySignDelete guibg=#002b36 guifg=#dc322f
  else
    highlight SignifySignAdd guibg=#fdf6e3 guifg=#579900
    highlight SignifySignChange guibg=#fdf6e3 guifg=#b58900
    highlight SignifySignDelete guibg=#fdf6e3 guifg=#dc322f
  endif

  autocmd FocusGained,FocusLost,BufEnter * call sy#util#refresh_windows()

  call neobundle#untap()
endif

if neobundle#tap('vim-dispatch')
  let g:dispatch_compilers = {'bundle exec': ''}
  call neobundle#untap()
endif

if neobundle#tap('vim-test')
  let g:test#strategy = 'dispatch'
  let g:test#ruby#cucumber#options = '--format progress'
  let g:test#javascript#mocha#options = '--reporter dot'

  nnoremap <silent> <Leader>r :TestNearest<Cr>
  nnoremap <silent> <Leader>R :TestFile<Cr>
  nnoremap <silent> <Leader>l :TestLast<Cr>

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

if neobundle#tap('vimfiler.vim')
  let g:vimfiler_as_default_explorer = 1
  let g:vimfiler_enable_clipboard = 0
  let g:vimfiler_ignore_pattern = ['^\%(\.git\|\.DS_Store\|tags\)$', '\.pyc$']
  let g:vimfiler_quick_look_command = 'qlmanage -p'
  let g:vimfiler_tree_leaf_icon = ' '
  let g:vimfiler_tree_opened_icon = '▾'
  let g:vimfiler_tree_closed_icon = '▸'
  let g:vimfiler_readonly_file_icon = '✗'
  let g:vimfiler_tree_indentation = 2

  call vimfiler#custom#profile('default', 'context', {
        \ 'auto_expand': 1,
        \ 'columns': '',
        \ 'parent': 1,
        \ 'safe': 0,
        \ 'winminwidth': 40,
        \ })

  nnoremap <silent> <Leader>on :VimFiler -explorer<Cr><C-W>=
  nnoremap <silent> <Leader>of :VimFiler -explorer -find<Cr><C-W>=

  function! helpers.toggle_maximize_vimfiler() abort
    if winwidth('%') == 100
      vertical resize 35
    else
      vertical resize 100
    endif
    call vimfiler#redraw_screen()
  endfunction

  autocmd FileType vimfiler call configure.vimfiler()
  function! configure.vimfiler()
    setlocal norelativenumber
    setlocal nonumber
    setlocal nobuflisted

    nunmap <buffer> <C-l>
    nunmap <buffer> <Space>

    nmap <buffer> R <Plug>(vimfiler_redraw_screen)
    nmap <buffer> C <Plug>(vimfiler_cd_file)

    nmap <buffer> <Enter> <Plug>(vimfiler_smart_l)
    nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_smart_l)

    nmap <buffer> p <Plug>(vimfiler_quick_look)
    nmap <buffer> ad <Plug>(vimfiler_make_directory)
    nmap <buffer> af <Plug>(vimfiler_new_file)

    nmap <buffer> v <Plug>(vimfiler_split_edit_file)
    nnoremap <buffer><expr> s vimfiler#do_switch_action('split')
    nnoremap <buffer><expr> t vimfiler#do_action('tabopen')

    nunmap <buffer> g<C-g>
    nnoremap <buffer> g<C-g> :call helpers.toggle_maximize_vimfiler()<Cr>
  endfunction

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
    \   "features/support/hooks.rb": {"alternate": "features/support/env.rb"},
    \   "features/step_definitions": {"type": "step"},
    \   "features/step_definitions/*_steps.rb": {"type": "step", "alternate": "features/{}.feature"}
    \ }
  \ }

  " quickly switch between E/S/V/T commands
  cnoremap <C-M-e> <C-b><Del>E<C-e>
  cnoremap <C-M-s> <C-b><Del>S<C-e>
  cnoremap <C-M-v> <C-b><Del>V<C-e>
  cnoremap <C-M-t> <C-b><Del>T<C-e>

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

if neobundle#tap('vim-mucomplete')
  let g:mucomplete#enable_auto_at_startup = 1

  call neobundle#untap()
endif

if neobundle#tap('vim-choosewin')
  let g:choosewin_overlay_enable = 0
  let g:choosewin_statusline_replace = 1
  let g:choosewin_keymap = {"\<Space>": 'previous'}

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
  let g:indent_guides_exclude_filetypes = ['help', 'vimfiler']

  call neobundle#untap()
endif

if neobundle#tap('scratch.vim')
  let g:scratch_no_mappings = 1
  nnoremap <Leader>s :Scratch<Cr>

  call neobundle#untap()
endif

if neobundle#tap('vimshell.vim')
  let g:vimshell_escape_colors = [
    \ '#6c6c6c', '#dc322f', '#859900', '#b58900',
    \ '#268bd2', '#d33682', '#2aa198', '#c0c0c0',
    \ '#383838', '#cb4b16', '#586e75', '#cb4b16',
    \ '#839496', '#d33682', '#2aa198', '#ffffff',
    \ ]

  autocmd FileType vimshell setlocal wrap

  call neobundle#untap()
endif

if neobundle#tap('tagbar')
  let g:tagbar_type_markdown = {
        \ 'ctagstype': 'markdown',
        \ 'sort': 0,
        \ 'kinds': [
        \   'h:headings',
        \   'l:links',
        \   'i:images'
        \ ]
        \ }

  let g:tagbar_type_cucumber = {
        \ 'ctagstype': 'gherkin',
        \ 'sort': 0,
        \ 'kinds': [
        \   'f:Feature',
        \   's:Scenario',
        \ ]
        \ }

  let g:tagbar_type_ruby = {
        \ 'ctagstype': 'Ruby',
        \ 'kinds': [
        \   'c:classes',
        \   'f:methods',
        \   'F:singleton methods',
        \   'm:modules',
        \   'n:namespaces',
        \   't:tasks'
        \ ]
        \ }

  call neobundle#untap()
endif

if neobundle#tap('vim-brightest')
  let g:brightest#highlight_in_cursorline = {'group': 'BrightestNONE'}
  let g:brightest#pattern = '\w\+'
  autocmd FileType cucumber
        \ let b:brightest_ignore_syntax_list = ['Identifier', 'Statement', 'Type']

  call neobundle#untap()
endif

if neobundle#tap('vim-yardoc')
  highlight link yardGenericTag rubyLocalVariableOrMethod
  call neobundle#untap()
endif

if neobundle#tap('incsearch.vim')
  let g:incsearch#magic = '\v'

  map / <Plug>(incsearch-forward)
  map ? <Plug>(incsearch-backward)

  call neobundle#untap()
endif

if neobundle#tap('rainbow')
  let g:rainbow_active = 1
  let g:rainbow_conf = {'guifgs': ['#cc241d', '#d65d0e', '#458588', '#b16286', '#cc241d', '#d65d0e']}

  call neobundle#untap()
endif


" Mappings {{{1
" -------------

" Use very magic
cnoremap %s/ %s/\v

" Disable terrible Ex mode
nnoremap Q <nop>

nnoremap <silent> <M-h> :wincmd h<Cr>
nnoremap <silent> <M-j> :wincmd j<Cr>
nnoremap <silent> <M-k> :wincmd k<Cr>
nnoremap <silent> <M-l> :wincmd l<Cr>

function! helpers.move_window_and_resize(direction) abort
  execute 'wincmd ' . a:direction
  execute 'wincmd ='
endfunction

nnoremap <silent> <M-H> :call helpers.move_window_and_resize('H')<Cr>
nnoremap <silent> <M-J> :call helpers.move_window_and_resize('J')<Cr>
nnoremap <silent> <M-K> :call helpers.move_window_and_resize('K')<Cr>
nnoremap <silent> <M-L> :call helpers.move_window_and_resize('L')<Cr>

nnoremap <M-T> :wincmd T<Cr>
nnoremap <M-w> :tabclose<Cr>

nnoremap _ :split<Cr>
nnoremap <Bar> :vsplit<Cr>

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

" Clear search
nnoremap <silent> <C-l> :let @/ = ""<Cr>

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
nnoremap <silent> [oq :cwindow<Cr>
nnoremap <silent> ]oq :cclose<Cr>

nnoremap j gj
nnoremap k gk

" swap : and ;
noremap ; :
noremap : ;

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" return to previous cursor position when copying from visual selection
vnoremap y y`]


" Autocommands {{{1
" -----------------

augroup Filetypes
  autocmd!

  autocmd BufNewFile,BufReadPost *file set filetype=ruby
  autocmd BufNewFile,BufReadPost *.load set filetype=fish
  autocmd BufNewFile,BufReadPost *.ejs set filetype=html
  autocmd BufNewFile,BufReadPost *.jelly set filetype=xml
  autocmd BufNewFile,BufReadPost .envrc set filetype=sh
  autocmd BufNewFile,BufReadPost inv_* set filetype=cfg
  autocmd BufNewFile,BufReadPost Makefile set filetype=make
  autocmd BufNewFile,BufReadPost Dockerfile* set filetype=dockerfile
  autocmd BufNewFile,BufReadPost *.bpf set filetype=json

  autocmd FileType puppet setlocal commentstring=#\ %s
  autocmd Filetype css setlocal iskeyword+=-

  autocmd FileType ruby setlocal iskeyword+=_
  " inside regexp text object
  " useful for working with Cucumber step definitions
  autocmd FileType ruby
    \ vnoremap <silent> <buffer> ix :<C-U>normal! ^f^lv$F$h<Cr>|
    \ onoremap <silent> <buffer> ix :normal vix<Cr>|

  autocmd FileType cucumber
    \ nmap <silent> <buffer> <Leader>gi ^ciwGiven<Esc>|
    \ nmap <silent> <buffer> <Leader>wh ^ciwWhen<Esc>|
    \ nmap <silent> <buffer> <Leader>th ^ciwThen<Esc>|
    \ nmap <silent> <buffer> <Leader>an ^ciwAnd<Esc>|

  " Remove service files from buffer list
  autocmd FileType qf setlocal nobuflisted
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

  " make vim-projectionist and vim-rails compatible (see tpope/vim-projectionist#36)
  autocmd BufNewFile,BufRead,BufWrite * call helpers.copy_projections()
  function! helpers.copy_projections() abort
    if !exists('b:projectionist') || !exists('b:rails_root')
      return
    endif

    let g:rails_projections = {}
    let app_projections = deepcopy(b:projectionist[b:rails_root])
    for projection_group in app_projections
      for projection in keys(projection_group)
        if has_key(projection_group[projection], 'type')
          let projection_group[projection]['command'] = projection_group[projection]['type']
          call remove(projection_group[projection], 'type')
        endif

        let g:rails_projections[projection] = projection_group[projection]
      endfor
    endfor
  endfunction

  " Save buffers and exit insert mode when leaving Vim.
  autocmd FocusLost * nested silent! wa
  autocmd FocusLost * if mode()[0] =~ 'i\|R' | call feedkeys("\<Esc>") | endif
augroup END


" Commands {{{1
" -------------

command! PrettyPrintJson :%!python -m json.tool

command! W w
command! Q q
command! WQ wq
command! Wq wq

" }}}

" vim: foldmethod=marker
