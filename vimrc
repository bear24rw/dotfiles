call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Wrap too long lines
set wrap

" Allow cursor everywhere
"set virtualedit=all

" Tabs are 2 characters
set tabstop=4

" (Auto)indent uses 2 characters
set shiftwidth=4
set softtabstop=4
set smartindent

" spaces instead of tabs
set expandtab

" guess indentation
set autoindent
set smartindent

" show line numbers
set number

" Fold using markers "{{{
" like this"}}}
" 
set foldmethod=marker

" enable all features
set nocompatible

" powerful backspaces
set backspace=indent,eol,start

" highlight the searchterms
set hlsearch

" jump to the matches while typing
set incsearch

" ignore case while searching
set ignorecase

" don't wrap words
set textwidth=0

" history
set history=50

" 1000 undo levels
set undolevels=1000

" show a ruler
set ruler

" show partial commands
set showcmd

" show matching braces
set showmatch

" write before hiding a buffer
set autowrite

" leave 4 lines on top or bottom when scrolling
set scrolloff=4

" allows hidden buffers to stay unsaved, but we do not want this, so comment
" it out:
"set hidden

" auto-detect the filetype
filetype plugin indent on

" Always show the menu, insert longest match
set completeopt=menuone,longest

" Expand the command line using tab
set wildchar=<Tab>
set wildmode=longest:full
set wildmenu

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

let &titleold=getcwd()
set titlestring=%t 

if &term == "screen" || &term == "screen-bce" || &term == "screen-256color"
  set t_ts=k
  set t_fs=\
endif
if &term == "screen" || &term == "screen-bce" || &term == "screen-256color" || &term == "xterm"
  set title
endif

command WQ wq
command Wq wq
command W w
command Q q

imap jj <ESC>  

" syntax highlight
syntax on

" enable 256 bit color mode
set t_Co=256

" use dark color scheme
set bg=dark
               
" some nice color schemes
colorscheme desert256
"colorscheme xoria256

let g:SuperTabDefaultCompletionType = "context"
highlight Pmenu ctermbg=238 gui=bold
