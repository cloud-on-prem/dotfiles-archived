set nocompatible           " get rid of Vi compatibility mode. SET FIRST!
set encoding=utf-8
filetype plugin indent on  " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256               " enable 256-color mode.
syntax enable              " enable syntax highlighting (previously syntax on).
set background=dark
set number                 " show line numbers
set laststatus=2           " last window always has a statusline
filetype indent on         " activates indenting for files
set nohlsearch             " Don't continue to highlight searched phrases.
set incsearch              " But do highlight as you type your search.
set ignorecase             " Make searches case-insensitive.
set ruler                  " Always show info along bottom.
set autoindent             " auto-indent
set tabstop=4              " tab spacing
set softtabstop=4          " unify
set shiftwidth=4           " indent/outdent by 4 columns
set shiftround             " always indent/outdent to the nearest tabstop
set expandtab              " use spaces instead of tabs
set smarttab               " use tabs at the start of a line, spaces elsewhere
set nowrap                 " don't wrap text
set nu
set ttimeoutlen=10         "wait for 10ms after escape
set hidden                 "Hide the buffers

syntax on
filetype plugin indent on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
noremap <C-H> :MBEbn<CR>
noremap <C-L> :MBEbp<CR>

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/tComment'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'bronson/vim-trailing-whitespace'

colorscheme molokai " set colorscheme

" Open Nerdtree
map <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let g:miniBufExplAutoStart = 1
let g:miniBufExplCycleArround = 0
