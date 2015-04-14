set nocompatible           " get rid of Vi compatibility mode. SET FIRST!
set laststatus=2           " last window always has a statusline
set nohlsearch             " Don't continue to highlight searched phrases.
set incsearch              " But do highlight as you type your search.
set ignorecase             " Make searches case-insensitive.
set ruler                  " Always show info along bottom.
set autoindent             " auto-indent
set nowrap                 " don't wrap text
set nu
set ttimeoutlen=10         "wait for 10ms after escape
set hidden                 "Hide the buffers
set tags=./tags            "Where to find ctags
set backspace=indent,eol,start
set autoread
set noswapfile " No swp files
set cursorline             " Highlight the current line
set eol " force blank lines at end of file
set scrolloff=3
set encoding=utf-8
set fileencodings=utf-8
set t_Co=256               " enable 256-color mode.
set term=screen-256color
let mapleader = ";" "set the leader key to ';' (easy to type)

" Mouse for scrolling etc in console.
set mouse=a

" " Resize split panes with mouse within tmux.
" " Also get live-updated text selection with mouse drag.
set ttymouse=xterm2

" Deal with Tabs
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
syntax enable
filetype off
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on

nnoremap <silent> <C-l> :nohl<CR><C-l>
" <Ctrl-l> redraws the screen and removes any search highlighting.

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

source ~/.vim.bundle

" Set up syntaxes
let g:syntastic_check_on_open=1
au BufRead,BufNewFile *.rabl set filetype=ruby
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.json set conceallevel=0
au BufRead,BufNewFile *.md set filetype=markdown

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
  set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ 11
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

map <Leader>V :e $MYVIMRC<CR> " Open Vimrc on a whim
nnoremap K i<CR><Esc> " Break lines with ease
map <Leader>p :set paste!<CR> " Paste stuff like a bos
nnoremap "p :reg<CR> " Show me the clipboard registry already!
map <Leader>\ :vsp<CR> " Open a split window on the right
map <Leader>- :sp<CR> " Open a split window bottom
map <Leader>q :q<CR> " Quit a Window
map <Leader>f :NERDTreeFind<CR> " Show the current file in Nerdtree
nnoremap <Leader>i ggVG=``

"Run specs like a boss
let g:specType = "rspec"
au FileType ruby call SetUpRubySpecs()

function! SetUpRubySpecs()
  if g:specType == "rspec"
    nnoremap <leader>r :w\|:call VimuxRunCommand("clear && bx rspec --format documentation ". bufname("%") . ":" . line("."))<CR>
  elseif g:specType == "minitest"
    nnoremap <leader>r :w\|:call VimuxRunCommand("clear && ruby -Ilib:test ". bufname("%"))<CR>
  endif
endfunction

"Git Blame
nnoremap <leader>gb :gblame<CR>

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

command! Spell set spell!
command! Refresh so $MYVIMRC

" Common spelling mistakes
command! Qa qa
command! Wq wq
command! W w

" Go Stuff
au FileType go nnoremap <leader>b :GoBuild<cr>
au FileType go nnoremap <leader>r :w\|:call VimuxRunCommand("clear && go run " . fnamemodify(bufname("%"), ":p"))<CR>

"Line Numbers
nnoremap <Leader>nu :set nu!<cr>

"Get rid of annoying white spaces
command! CleanSpaces :%s/\s\+$//

set rtp+=~/.fzf

let g:ctrlp_show_hidden = 1

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

function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<C-k>"
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

nnoremap <Leader>w :set nowrap!<cr>

" ------- Folding
set foldmethod=syntax
set foldlevelstart=10
nnoremap <Space> za
vnoremap <Space> za
