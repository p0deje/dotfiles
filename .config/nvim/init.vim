" init.vim

" Plugins management {{{1
" -----------------------

call plug#begin('~/.local/share/nvim/plugged')

" Completion {{{2

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'

" }}} Development {{{2

Plug 'bergercookie/vim-debugstring'
Plug 'keith/investigate.vim'
Plug 'majutsushi/tagbar', {'on': 'Tagbar'}
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-scriptease'

" }}} Integrations {{{2

Plug 'direnv/direnv.vim'
Plug 'junegunn/gv.vim', {'on': ['GV', 'GV!']} " depends: vim-fugitive
Plug 'mattn/gist-vim', {'on': 'Gist'} " depends: webapi-vim
Plug 'mattn/webapi-vim'
Plug 'tommcdo/vim-fugitive-blame-ext', {'for': 'fugitiveblame'}
Plug 'tpope/vim-fugitive' " depends: vim-git
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'
Plug 'whiteinge/diffconflicts', {'on': 'DiffConflicts'}

" }}} Linting, testing {{{2

Plug 'dense-analysis/ale'
Plug 'janko-m/vim-test'
Plug 'radenling/vim-dispatch-neovim' " depends: vim-dispatch
Plug 'Shougo/vimproc', {'do': 'make -f make_mac.mak'}
Plug 'tpope/vim-dispatch'

" }}} Motions and operators {{{2

Plug 'AndrewRadev/dsf.vim'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'Lokaltog/vim-easymotion'
Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'} " depends: vim-textobj-user
Plug 'qstrahl/vim-dentures'
Plug 'wellle/targets.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" }}} Navigation {{{2

Plug 'airblade/vim-rooter', {'commit': '3509dfb'}
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim' " Replace with defx.nvim once it supports choosewin and tree-like mode; depends: unite.vim
Plug 'tpope/vim-haystack'
Plug 'tpope/vim-projectionist' " depends: vim-haystack

" }}} Search and replace {{{2

Plug 'AndrewRadev/writable_search.vim', {'on': ['WritableSearch', 'WritableSearchFromQuickfix']}
Plug 'haya14busa/incsearch.vim'
Plug 'mhinz/vim-grepper'
Plug 'osyo-manga/vim-anzu'
Plug 'tpope/vim-abolish'

" }}} Syntax and filetypes {{{2

Plug 'dag/vim-fish'
Plug 'dhruvasagar/vim-table-mode', {'for': ['cucumber', 'markdown']}
Plug 'elixir-lang/vim-elixir'
Plug 'kchmck/vim-coffee-script'
Plug 'keith/swift.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mzlogin/vim-markdown-toc', {'for': 'markdown'}
Plug 'noprompt/vim-yardoc'
Plug 'p0deje/vim-cucumber', {'branch': '_merge'}
Plug 'p0deje/vim-ruby-interpolation', {'for': 'ruby'}
Plug 'peitalin/vim-jsx-typescript'
Plug 'PProvost/vim-ps1'
Plug 'rodjek/vim-puppet'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise', {'for': 'ruby'}
Plug 'vim-ruby/vim-ruby'

" }}} UI {{{2

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline' " depends: vim-airline-themes
Plug 'fourjay/vim-flexagon'
Plug 'junegunn/limelight.vim', {'on': 'Limelight'}
Plug 'luochen1990/rainbow'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'RRethy/vim-illuminate'
Plug 'ryanoasis/vim-devicons'
Plug 'TaDaa/vimade'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'

" }}} Vim improved (again) {{{2

Plug 'AndrewRadev/linediff.vim', {'on': 'Linediff'}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/whitespaste.vim'
Plug 'andymass/vim-matchup'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jiangmiao/auto-pairs'
Plug 'kopischke/vim-fetch'
Plug 'kshenoy/vim-signature'
Plug 'mtth/scratch.vim'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'schickling/vim-bufonly', {'on': 'Bonly'}
Plug 'sickill/vim-pasta'
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-subversive'
Plug 'svermeulen/vim-yoink'
Plug 't9md/vim-choosewin'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'yssl/QFEnter'
Plug 'vim-scripts/DeleteTrailingWhitespace'

" }}}

call plug#end()


" Vim options {{{1
" ----------------

set autowrite            " Automatically :write before running commands
set clipboard=unnamed    " Use system clipboard
set cursorline           " highlight current line
set exrc                 " enable per-directory .vimrc files
set foldcolumn=1         " increase vsplits margin
set hidden               " abandon hidden buffers
set inccommand=nosplit   " live-preview of substitution
set lazyredraw           " faster scrolling
set noshowcmd            " hide expanded mappings
set noswapfile           " no *.swp artifacts
set number               " show line numbers
set secure               " disable unsafe commands in local .vimrc files
set shiftwidth=2         " autoindent level
set showtabline=2        " always show tabline
set termguicolors        " fix colors for airline
set undofile             " tell it to use an undo file
set virtualedit=block    " allow selecting beyond line end

" Line wrapping
set linebreak
set breakindent

" Better search
set ignorecase
set smartcase

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Enable spelling check
set spell

" Do not save empty windows
set sessionoptions-=blank

" Better completion for cmd mode
set wildignorecase
set wildignore=*.pyc
set wildmode=longest,full

" Completion improvements
set completeopt+=menu
set completeopt+=menuone
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview
set shortmess+=c

" Support Fugitive tags
set tags^=./.git/tags;

" Let's not be retarded
let g:mapleader = ','

" Highlight long lines
let &colorcolumn=81

" Syntax Highlighting in Markdown
let g:markdown_fenced_languages = [
      \ 'cucumber',
      \ 'ruby',
      \ 'sh',
      \ 'bash=sh',
      \ ]

" Containers for functions
let configure = {}
let helpers = {}


" Plugin options {{{1
" -------------------

" }}} airline {{{2

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#ignore_bufadd_pat = '\c\vgundo|vimfiler|tagbar'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#tab_nr_type = 1

" }}} ale {{{2

let g:ale_sign_column_always = 1
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
let g:ale_warn_about_trailing_whitespace = 0
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {'ruby': ['rubocop', 'ruby']}
let g:ale_ruby_rubocop_options = '--no-display-cop-names'

let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '=> '
let g:ale_virtualtext_delay = 100

" }}} AnsiEsc {{{2

let g:no_cecutil_maps = 1

" }}} auto-pairs {{{2

" Clear <M-p> mapping
let g:AutoPairsShortcutToggle = ''

" Autoclose pipe in Ruby
autocmd FileType ruby
      \ let b:AutoPairs = {'|': '|'} |
      \ for key in keys(g:AutoPairs) |
      \   let b:AutoPairs[key] = g:AutoPairs[key] |
      \ endfor

" }}} choosewin {{{2

let g:choosewin_overlay_enable = 0
let g:choosewin_statusline_replace = 1
let g:choosewin_keymap = {"\<Space>": 'previous'}

nmap <Space> <Plug>(choosewin)

" }}} cutlass {{{2

nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

" }}} DeleteTrailingWhitespace {{{2

let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

" }}} deoplete {{{2

let g:deoplete#enable_at_startup = 1

call deoplete#custom#source('file', 'rank', 1000)

function! helpers.close_complete_and_add_newline() abort
  return deoplete#close_popup() . "\<Cr>"
endfunction

inoremap <silent> <Cr> <C-r>=helpers.close_complete_and_add_newline()<Cr>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" }}} devicons {{{2

let g:webdevicons_enable_vimfiler = 0

" }}} dispatch {{{2

let g:dispatch_compilers = {'bundle exec': ''}

" }}} easymotion {{{2

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

map gj <Plug>(easymotion-s2)

" }}} flexagon {{{2

let g:flexagon_disable_foldtext = 1

" }}} fugitive {{{2

nnoremap gst :Gstatus<Cr>

" }}} fzf {{{2

let g:fzf_buffers_jump = 1
let g:fzf_layout = {'down': '~20%'}
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }

nnoremap <C-P> :Files<Cr>
nnoremap gb :Buffers<Cr>

" }}} gist-vim {{{2

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

" }}} grepper {{{2

let g:grepper = {
      \ 'highlight': 1,
      \ 'open': 0,
      \ 'tools': ['rg'],
      \ 'rg': {
      \   'grepprg': 'rg --with-filename --smart-case --no-heading --vimgrep $* | sort',
      \   'escape': 0
      \ }
      \ }
autocmd User Grepper copen | call helpers.move_window_and_resize('J')

nmap ga <Plug>(GrepperOperator)
xmap ga <Plug>(GrepperOperator)

nnoremap ga<Space> :GrepperRg<Space>
nnoremap <silent> gac :execute 'GrepperRg ' . shellescape(@+)<Cr>

" }}} gruvbox {{{2

colorscheme gruvbox

function! init#configure_colors(...) abort
  if !has("gui_vimr")
    return 1
  endif

  let s:os_mode = systemlist('defaults read -g AppleInterfaceStyle')[0]
  if s:os_mode ==? 'dark'
    if &background != 'dark'
      set background=dark
    else
      return 1
    endif
  else
    if &background != 'light'
      set background=light
    else
      return 1
    endif
  endif

  highlight! ALEVirtualTextError guifg=gray
  highlight! ALEVirtualTextWarning guifg=gray
  highlight! ALEVirtualTextStyleError guifg=gray

  highlight! CursorLineNr guibg=g:terminal_color_0
  highlight! FoldColumn guibg=g:terminal_color_0
  highlight! SignColumn guibg=g:terminal_color_0
  highlight! GruvboxAquaSign guibg=g:terminal_color_0
  highlight! GruvboxBlueSign guibg=g:terminal_color_0
  highlight! GruvboxGreenSign guibg=g:terminal_color_0
  highlight! GruvboxRedSign guibg=g:terminal_color_0
  highlight! GruvboxYellowSign guibg=g:terminal_color_0
endfunction

call init#configure_colors()
call timer_start(30000, 'init#configure_colors', {'repeat': -1})

" }}} gundo {{{2

let g:gundo_right = 1

" }}} incsearch {{{2

let g:incsearch#magic = '\v'

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)

" }}} indentLine {{{2

let g:indentLine_char = '┊'
let g:indentLine_bufNameExclude = ['vimfiler:explorer.*', 'startify']
let g:indentLine_bufTypeExclude = ['help']
let g:indentLine_fileTypeExclude = ['json']

" }}} investigate {{{2

let g:investigate_use_dash = 1

" }}} LanguageClient {{{2

let g:LanguageClient_serverCommands = {
      \ 'ruby': ['solargraph', 'stdio'],
      \ }

" }}} lion {{{2

let g:lion_squeeze_spaces = 1

" }}} projectionist {{{2

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

" }}} QFEnter {{{2

let g:qfenter_enable_autoquickfix = 1
let g:qfenter_keymap = {
      \ "open": ['<CR>', '<2-LeftMouse>'],
      \ "vopen": ['v'],
      \ "hopen": ['s'],
      \ "topen": ['t'],
      \ }

" }}} rainbow {{{2

let g:rainbow_active = 1
let g:rainbow_conf = {'guifgs': ['#cc241d', '#d65d0e', '#458588', '#b16286', '#cc241d', '#d65d0e']}

" }}} rooter {{{2

let g:rooter_silent_chdir = 1

" }}} scratch {{{2

let g:scratch_no_mappings = 1
nnoremap <Leader>s :Scratch<Cr>

" }}} signature {{{2

" Leave "m" for vim-easyclip
let g:SignatureMap = {'Leader': 'gm'}

" }}} startify {{{2

let g:startify_session_dir = '~/.local/share/nvim/sessions'
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

" }}} subversive {{{2

nmap gr <Plug>(SubversiveSubstitute)
nmap grr <Plug>(SubversiveSubstituteLine)

" }}} surround {{{2

autocmd FileType ruby let b:surround_{char2nr('r')} = "do \r end"

" }}} switch {{{2

let g:switch_mapping = "gsw"

" }}} table-mode {{{2

let g:table_mode_disable_mappings = 1
let g:table_mode_corner = '|'

autocmd FileType cucumber,markdown silent! :TableModeEnable
autocmd FileType cucumber,markdown imap <buffer> <Bar> <Plug>(table-mode-tableize)

" }}} tagbar {{{2

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
      \   't:tasks',
      \   'd:describes',
      \   'C:contexts',
      \   'e:examples'
      \ ]
      \ }

" }}} test {{{2

let g:test#strategy = 'dispatch'
let g:test#ruby#cucumber#options = '--format progress'
let g:test#javascript#mocha#options = '--reporter dot'

nnoremap <silent> <Leader>r :TestNearest<Cr>
nnoremap <silent> <Leader>R :TestFile<Cr>
nnoremap <silent> <Leader>l :TestLast<Cr>

" }}} vimfiler {{{2

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
      \ 'explorer_columns': 'devicons',
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

  try
    nunmap <buffer> <C-l>
    nunmap <buffer> <Space>
  catch
    " race condition
  endtry

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

" }}} yardoc {{{2

highlight link yardGenericTag rubyLocalVariableOrMethod

" }}} yoink {{{2

let g:yoinkIncludeDeleteOperations = 1

nmap <M-p> <Plug>(YoinkPostPasteSwapBack)
nmap <M-S-p> <Plug>(YoinkPostPasteSwapForward)

nmap p <Plug>(YoinkPaste_p)
nmap P <Plug>(YoinkPaste_P)

" }}}

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

nnoremap <M-S-t> :wincmd T<Cr>
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

if has("gui_vimr")
  nnoremap <D-S-{> gT
  nnoremap <D-S-}> gt

  nnoremap <D-S-w> :qa<Cr>

  inoremap <D-Left> <C-o>^
  cnoremap <D-Left> <C-b>

  inoremap <D-Right> <C-o>$
  cnoremap <D-Right> <C-e>

  inoremap <D-Backspace> <C-u>
  cnoremap <D-Backspace> <C-u>

  inoremap <M-Left> <C-o>b
  cnoremap <M-Left> <M-S-Left>

  inoremap <M-Right> <C-o>w
  cnoremap <M-Right> <M-S-Right>

  inoremap <M-Backspace> <C-w>
  cnoremap <M-Backspace> <C-w>

  nnoremap <D-;> :Commands<Cr>
endif

" Autocommands {{{1
" -----------------

augroup AutoSaveFolds
  autocmd!

  autocmd BufWinLeave *.* silent! mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

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
  autocmd BufNewFile,BufReadPost Jenkinsfile set filetype=groovy
  autocmd BufNewFile,BufReadPost *.bpf set filetype=json
  autocmd BufNewFile,BufReadPost BUCK,build.desc set filetype=bzl

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
  autocmd FileType qf
        \ setlocal nobuflisted|
        \ nnoremap <silent> <buffer> q :q<Cr>|
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

  " make sure exrc is loaded for session
  autocmd SessionLoadPost * if filereadable('.vimrc') | source .vimrc | endif

  " Workaround for broken autoread: neovim/neovim#1936
  autocmd FocusGained * :checktime
augroup END


" Commands {{{1
" -------------

command! PrettyPrintJson :%!python -m json.tool

command! W w
command! Q q
command! WQ wq
command! Wq wq

command! -bang Only :silent only | :silent tabonly | :silent Bonly<bang>
command! CopyFilePath :silent let @+ = expand("%:p")

" }}}

" vim: foldmethod=marker
