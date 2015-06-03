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
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'DeleteTrailingWhitespace'
NeoBundle 'dhruvasagar/vim-table-mode', {'lazy': 1, 'filetypes': 'cucumber'}
NeoBundle 'dag/vim-fish'
NeoBundle 'henrik/vim-qargs', {'lazy': 1, 'filetypes': 'qf'}
NeoBundle 'janko-m/vim-test'
NeoBundle 'JazzCore/ctrlp-cmatcher', {'build': {'mac': './install.sh'}}
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'junegunn/vim-easy-align', {'lazy': 1, 'mappings': '<Plug>(EasyAlign)'}
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'majutsushi/tagbar', {'lazy': 1, 'commands': 'Tagbar'}
NeoBundle 'mattn/gist-vim', {'lazy': 1, 'commands': 'Gist', 'depends': 'mattn/webapi-vim'}
NeoBundle 'mhinz/vim-startify'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'mtth/scratch.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'nelstrom/vim-textobj-rubyblock', {'lazy': 1, 'filetypes': 'ruby', 'depends': 'kana/vim-textobj-user'}
NeoBundle 'noprompt/vim-yardoc'
NeoBundle 'osyo-manga/vim-brightest'
NeoBundle 'p0deje/vim-dispatch-vimshell', {'depends': ['tpope/vim-dispatch', 'Shougo/vimshell.vim']}
NeoBundle 'p0deje/vim-numbertoggle'
NeoBundle 'p0deje/vim-ruby-interpolation'
NeoBundle 'qstrahl/vim-dentures'
NeoBundle 'rgrinberg/vim-operator-gsearch', {'depends': ['kana/vim-operator-user', 'rking/ag.vim']}
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'schickling/vim-bufonly', {'lazy': 1, 'commands': 'Bonly'}
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplete.vim', {'lazy': 1, 'insert': 1}
NeoBundle 'Shougo/neosnippet.vim', {'lazy': 1, 'insert': 1, 'depends': 'Shougo/neosnippet-snippets'}
NeoBundle 'Shougo/vimproc', {'build': {'mac': 'make -f make_mac.mak'}}
NeoBundle 'sjl/gundo.vim', {'lazy': 1, 'commands': 'GundoToggle'}
NeoBundle 'slim-template/vim-slim'
NeoBundle 'svermeulen/vim-easyclip', {'rev': 'develop', 'depends': 'tpope/vim-repeat'}
NeoBundle 'taiansu/nerdtree-ag', {'lazy': 1, 'filetypes': 'nerdtree'}
NeoBundle 't9md/vim-choosewin', {'lazy': 1, 'mappings': '<Plug>'}
NeoBundle 'kristijanhusak/vim-multiple-cursors'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'tommcdo/vim-fugitive-blame-ext', {'lazy': 1, 'filetypes': 'fugitiveblame'}
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-commentary', {'lazy': 1, 'mappings': 'gc'}
NeoBundle 'p0deje/vim-cucumber', {'rev': '_merge'}
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
set linebreak
set virtualedit=block
set hidden
set wrap
set shiftwidth=2

set ignorecase
set smartcase

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Search tweaks
set hlsearch
set incsearch

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
set wildmode=longest,full

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
  autocmd FocusLost * silent! wa
endif


" Plugin options {{{1
" -------------------

if neobundle#tap('vim-colors-solarized')
  let g:solarized_contrast = 'high'
  let g:solarized_visibility = 'low'

  set background=light
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
  nnoremap gag :Ag!<Space>
  nnoremap <silent> gac :execute 'Ag! ' . shellescape(@+)<Cr>

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
  let g:syntastic_ruby_rubocop_args = '--display-cop-names'

  " Disable checkers for schema
  autocmd BufNewFile,BufReadPost schema.rb let b:syntastic_skip_checks = 1

  call neobundle#untap()
endif

if neobundle#tap('vim-easymotion')
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_use_smartsign_us = 1

  nmap ? <Plug>(easymotion-s)
  omap ? <Plug>(easymotion-s)
  vmap ? <Plug>(easymotion-s)

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

  nmap <silent> <Leader>r :TestNearest<Cr>
  nmap <silent> <Leader>R :TestFile<Cr>
  nmap <silent> <Leader>l :TestLast<Cr>

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

if neobundle#tap('vim-projectionist') && neobundle#tap('vim-rails')
  " Fix incompatibility: tpope/vim-projectionist#36
  let g:rails_projections = {}
  let local_projections = deepcopy(g:projectionist_heuristics)
  for projections in keys(local_projections)
    for projection in keys(local_projections[projections])
      if has_key(local_projections[projections][projection], 'alternate')
        let g:rails_projections[projection] = deepcopy(local_projections[projections][projection])
        let g:rails_projections[projection]['alternate'] =
          \ substitute(local_projections[projections][projection]['alternate'], '{}', '%s', '')
      endif
    endfor
  endfor

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

if neobundle#tap('neocomplete.vim') && neobundle#tap('neosnippet.vim')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#disable_auto_complete = 1
  let g:neocomplete#enable_ignore_case = 0
  let g:neocomplete#enable_fuzzy_completion = 1
  let g:neocomplete#ctags_command = '/usr/local/bin/ctags'
  let g:neocomplete#fallback_mappings = ["\<C-x>\<C-k>"]

  " Complete with <Tab>

  function! s:IsPreviousCharSpace()
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
  endfunction

  imap <expr><Tab>
        \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" :
        \   pumvisible() ? "\<C-n>" :
        \     <SID>IsPreviousCharSpace() ? "\<Tab>" :
        \       neocomplete#start_manual_complete()
  imap <expr><M-Tab> "\<C-p>"

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
  let g:choosewin_overlay_enable = 1
  let g:choosewin_statusline_replace = 0

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
  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

  call neobundle#untap()
endif

if neobundle#tap('scratch.vim')
  let g:scratch_no_mappings = 1
  call neobundle#untap()
endif

if neobundle#tap('vimshell.vim')
  let g:vimshell_escape_colors = [
    \ '#6c6c6c', '#dc322f', '#859900', '#b58900',
    \ '#268bd2', '#d33682', '#2aa198', '#c0c0c0',
    \ '#383838', '#cb4b16', '#586e75', '#cb4b16',
    \ '#839496', '#d33682', '#2aa198', '#ffffff',
    \ ]
  call neobundle#untap()
endif

if neobundle#tap('tagbar.vim')
  let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
        \   'h:Heading_L1',
        \   'i:Heading_L2',
        \   'k:Heading_L3'
        \   ]
        \ }

  let g:tagbar_type_cucumber = {
        \ 'ctagstype' : 'gherkin',
        \ 'kinds' : [
        \   'f:Feature',
        \   's:Scenario',
        \   ]
        \ }

  call neobundle#untap()
endif

if neobundle#tap('vim-brightest')
  let g:brightest#highlight_in_cursorline = {"group" : "BrightestNONE"}
  call neobundle#untap()
endif


" Mappings {{{1
" -------------

" Use very magic
nnoremap / /\v
cnoremap %s/ %s/\v

" Disable terrible Ex mode
nnoremap Q <nop>
nnoremap q: <nop>

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

nnoremap _ :split<Cr>
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
nnoremap <silent> [oq :cwindow<Cr>
nnoremap <silent> ]oq :cclose<Cr>

nnoremap j gj
nnoremap k gk


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

  " hit K to get help on current word
  autocmd FileType vim setlocal keywordprg=:help

  autocmd FileType puppet set commentstring=#\ %s

  " inside regexp text object
  " useful for working with Cucumber step definitions
  autocmd FileType ruby
    \ vnoremap <silent> <buffer> ix :<C-U>normal! ^f^lv$F$h<Cr>|
    \ omap <silent> <buffer> ix :normal Vix<Cr>

  autocmd FileType cucumber
    \ nmap <silent> <buffer> <Leader>gi ^ciwGiven<Esc>|
    \ nmap <silent> <buffer> <Leader>wh ^ciwWhen<Esc>|
    \ nmap <silent> <buffer> <Leader>th ^ciwThen<Esc>|
    \ nmap <silent> <buffer> <Leader>an ^ciwAnd<Esc>|
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
