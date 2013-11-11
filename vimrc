" General {{{

" Tabs {{{

" Tabs are 2 characters
set tabstop=4

" (Auto)indent uses 2 characters
set shiftwidth=4
set softtabstop=4
set smartindent

" spaces instead of tabs
set expandtab

" }}}

" Search {{{

" highlight the searchterms
set hlsearch

" jump to the matches while typing
set incsearch

" ignore case while searching
set ignorecase

" execpt when searching for upper case
set smartcase

" }}}

" enable all features
set nocompatible

" dont wrap long lines
set nowrap

" guess indentation
set autoindent
set smartindent

" don't reset cursor to start of line when moving around
set nostartofline

" show line numbers
set number

" fold using {{{ }}}
set foldmethod=marker

" open folds when searching, etc...
set foldopen=jump,mark,search,tag,undo

" powerful backspaces
set backspace=indent,eol,start

" don't wrap words
set textwidth=0

" history
set history=50

" 1000 undo levels
set undolevels=1000

" persistent undo
set undofile

" show a ruler
set ruler

" show partial commands
set showcmd

" show matching braces
set showmatch

" highlight current line
set cursorline

" leave 4 lines on top or bottom when scrolling
set scrolloff=4
set sidescrolloff=4

" when buffer is brought to foregroup, remember undo history and marks
set hidden

" auto-detect the filetype
filetype plugin indent on

" disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" indent c preprocessors
set cinkeys=0{,0},0),:,!^F,o,O,e

" }}}

" Tab completion {{{

" Always show the menu, insert longest match
set completeopt=menuone,longest

" Expand the command line using tab
set wildchar=<Tab>
set wildmode=longest:full
set wildmenu

" tab complete text
set omnifunc=syntaxcomplete#Complete

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"}}}

" Title bar {{{

let &titleold=getcwd()
set titlestring=%t 

if &term == "screen" || &term == "screen-bce" || &term == "screen-256color"
  set t_ts=k
  set t_fs=\
endif
if &term == "screen" || &term == "screen-bce" || &term == "screen-256color" || &term == "xterm"
  set title
endif

" }}}

" Keybindings {{{

" clear the ctrl+j binding
let g:BASH_Ctrl_j = 'off'
let g:C_Ctrl_j = 'off'

" change leader key to comma
let mapleader=","

" better split switching
"map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

command WA wa
command Wa wa
command WQ wq
command Wq wq
command W w
command Q q

" yank from cursor to end of line
nnoremap Y y$

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" force write with sudo
cmap w!! w !sudo tee >/dev/null %

" }}}

" Color {{{

" syntax highlight
syntax on

" enable 256 bit color mode
set t_Co=256

" use dark color scheme
set bg=dark

" line numbers are grey with black
highlight LineNr ctermbg=0 ctermfg=235

" current line highlighting
highlight CursorLine ctermbg=234

" }}}

" gvim specific options
if has("gui_running")
    set go-=T
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 14
end

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

source $HOME/.vim/bundles.vim
