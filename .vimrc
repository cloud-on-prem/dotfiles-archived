set nocompatible           " get rid of Vi compatibility mode. SET FIRST!
set laststatus=2           " last window always has a statusline
set nohlsearch             " Don't continue to highlight searched phrases.
set incsearch              " But do highlight as you type your search.
set ignorecase             " Make searches case-insensitive.
set ruler                  " Always show info along bottom.
set autoindent             " auto-indent
set tabstop=2              " tab spacing
set softtabstop=2          " unify
set shiftwidth=2           " indent/outdent by 4 columns
set shiftround             " always indent/outdent to the nearest tabstop
set expandtab              " use spaces instead of tabs
set smarttab               " use tabs at the start of a line, spaces elsewhere
set nowrap                 " don't wrap text
set nu
set ttimeoutlen=10         "wait for 10ms after escape
set hidden                 "Hide the buffers
set tags=./tags            "Where to find ctags

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let mapleader = ";" "set the leader key to ';' (easy to type)
nnoremap <silent> <C-l> :nohl<CR><C-l>
" <Ctrl-l> redraws the screen and removes any search highlighting.

"Enable Matchit
runtime macros/matchit.vim

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/tComment'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-rails'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'othree/html5.vim'
Bundle 'wavded/vim-stylus'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mattn/emmet-vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-fugitive'
Bundle 'wookiehangover/jshint.vim'
Bundle 'bling/vim-airline'
Bundle 'Lokaltog/powerline-fonts'
Bundle 'mhinz/vim-signify'
Bundle 'scrooloose/syntastic'

" Look and Feel
set background=dark
colorscheme molokai
set cursorline " Highlight the current line
" set cuc cul " Highlight active column
set number
set ruler
set eol " force blank lines at end of file
syntax on
filetype off
filetype plugin indent on
set scrolloff=3
set encoding=utf-8
set fileencodings=utf-8
set t_Co=256               " enable 256-color mode.
syntax enable              " enable syntax highlighting (previously syntax on).

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
let g:airline_powerline_fonts=1
let g:airline_left_alt_sep = '▶'
let g:airline_left_sep = '▶'
let g:airline_right_alt_sep = '◀'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

if has('gui_running')
  set guifont=Inconsolata:h18
endif


" Open Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.swp$','.DS_Store', '.git[[dir]]', '.sass-cache[[dir]]']

" Fix multiple cursors key mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-f>'
let g:multi_cursor_prev_key='<C-d>'
let g:multi_cursor_skip_key='<C-g>'
let g:multi_cursor_quit_key='<Esc>'

" Tabs
map <C-t> :tabnew<CR>
map <C-S-Right> gt
map <C-S-Left> gT

let NERDTreeShowHidden=1

" Coffeescript Support
hi link coffeeReservedError NONE
hi link coffeeSemicolonError NONE
hi link coffeeSpaceError NONE

" No swp files
set noswapfile


" Set the status line powered by fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Set up syntaxes
au BufRead,BufNewFile *.rabl setf ruby


" Mouse for scrolling etc in console.
set mouse=a
"
" " Resize split panes with mouse within tmux.
" " Also get live-updated text selection with mouse drag.
set ttymouse=xterm2

map <Leader>V :e $MYVIMRC<CR> " Open Vimrc on a whim
map <Leader>p :set paste!<CR> " Paste stuff like a boss
map <Leader>v :vsp<CR> " Open a split window
map <Leader>w <C-w>w " Cycle between windows
map <Leader>f :NERDTreeFind<CR> " Show the current file in Nerdtree
