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
set backspace=indent,eol,start

set cursorline             " Highlight the current line
set eol " force blank lines at end of file
set scrolloff=3
set encoding=utf-8
set fileencodings=utf-8
set t_Co=256               " enable 256-color mode.
syntax enable              " enable syntax highlighting (previously syntax on).
set term=screen-256color
let mapleader = ";" "set the leader key to ';' (easy to type)

" Mouse for scrolling etc in console.
set mouse=a

" " Resize split panes with mouse within tmux.
" " Also get live-updated text selection with mouse drag.
set ttymouse=xterm2

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on

" No swp files
set noswapfile

nnoremap <silent> <C-l> :nohl<CR><C-l>
" <Ctrl-l> redraws the screen and removes any search highlighting.

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'premjg/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/tComment'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-rails'
Plugin 'othree/html5.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'benmills/vimux'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'Shougo/neocomplete.vim'
Plugin 'fatih/vim-go'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'chrisbra/unicode.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround.git'
Plugin 'neilagabriel/vim-geeknote'

call vundle#end()

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Look and Feel
set background=dark
if filereadable( expand("$HOME/.vim/bundle/vim-colorschemes/colors/gruvbox.vim") )
  colorscheme gruvbox
  " colorscheme molokai
  " colorscheme solarized
  " colorscheme vividchalk
end
hi Normal ctermfg=252 ctermbg=none

" Airline conf
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1

if has('gui_running')
  set guifont=Sauce_Code_Powerline_Light:h20
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
nnoremap <C-t> :tabnew<CR>
nnoremap <Leader>h :tabnext<CR>
nnoremap <Leader>l :tabprev<CR>
nnoremap <Leader>T <C-W>T<CR> " Move split into a new Tab
nnoremap <Leader>X :tabclose<CR> " Close current Tab

" Tag bar
let g:tagbar_left=1
map <Leader>tg :TagbarOpenAutoClose<CR>

let NERDTreeShowHidden=1

" Disable Arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Coffeescript Support
hi link coffeeReservedError NONE
hi link coffeeSemicolonError NONE
hi link coffeeSpaceError NONE

" Set up syntaxes
au BufRead,BufNewFile *.rabl setf ruby

map <Leader>V :e $MYVIMRC<CR> " Open Vimrc on a whim
map <Leader>p :set paste!<CR> " Paste stuff like a bos
nnoremap "p :reg<CR> " Show me the clipboard registry already!
map <Leader>\ :vsp<CR> " Open a split window on the right
map <Leader>- :sp<CR> " Open a split window bottom
map <Leader>q :q<CR> " Quit a Window
map <Leader>f :NERDTreeFind<CR> " Show the current file in Nerdtree
nnoremap <Leader>i ggVG=``
au BufNewFile,BufRead *.md set filetype=markdown

"Run specs like a boss
let g:specType = "rspec"
au FileType ruby call SetUpRubySpecs()

function! SetUpRubySpecs()
  if g:specType == "rspec"
    nnoremap <leader>r :w\|:call VimuxRunCommand("clear && zeus rspec --format documentation ". bufname("%") . ":" . line("."))<CR>
  elseif g:specType == "minitest"
    nnoremap <leader>r :w\|:call VimuxRunCommand("clear && ruby -Ilib:test ". bufname("%"))<CR>
  endif
endfunction

"Git Blame
nnoremap <leader>gb :call VimuxRunCommand("git log -20 --pretty='%h %C(yellow)%an %Creset %cr: %s ' " . bufname("%") )<CR>

"Update Ctags
nnoremap <Leader>ct :!sudo bash ~/.dotfiles/scripts/ctags-auto.sh<CR>

" Search for selected text, forwards or backwards
vnoremap <silent> * :<C-U>
      \ let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \ gvy/<C-R><C-R>=substitute(
      \ escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \ gV:call setreg('"', old_reg, old_regtype)<CR>
" -------------------------------------------------

" Quick Ack Word
nnoremap <Leader>a :Ag <C-r><C-w>

command! Sc set spell!
command! Refresh so $MYVIMRC

" Common spelling mistakes
command! Qa qa
command! Wq wq

" Go Stuff
au FileType go nnoremap <leader>b :GoBuild<cr>
au FileType go nnoremap <leader>r :w\|:call VimuxRunCommand("clear && go run " . fnamemodify(bufname("%"), ":p"))<CR>

"Line Numbers
nnoremap <Leader>nu :set nu!<cr>

"Get rid of annoying white spaces
command! CleanSpaces :%s/\s\+$//

set rtp+=~/.fzf


"Neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
set completeopt-=preview " don't open a scratch window when auto completing

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"Neocomplete end

" Ultisnips
let g:UltiSnipsEditSplit = 'vertical'
command! Snip :UltiSnipsEdit
let g:Unicode_ShowPreviewWindow = 1


let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Easymotion
nmap s <Plug>(easymotion-sn)
"
" " Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
"
" " JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)"

nnoremap <Leader>w :set nowrap!<cr>
