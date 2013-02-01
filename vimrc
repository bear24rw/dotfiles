call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1

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

" change leader key to comma
let mapleader=","

" better split switching
map <C-j> <C-W>j
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

" Gundo toggle
nnoremap <F5> :GundoToggle<CR>

" tabular shortcuts
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" }}}

" Color {{{

" syntax highlight
syntax on

" enable 256 bit color mode
set t_Co=256

" use dark color scheme
set bg=dark

" some nice color schemes
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" line numbers are grey with black
highlight LineNr ctermbg=0 ctermfg=235

" current line highlighting
highlight CursorLine ctermbg=234

" highlight trailing whitepace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" }}}

" Status Line {{{

" powerline plugin needs two lines
set laststatus=2

" encoding
set encoding=utf-8

let g:Powerline_symbols = "compatible"

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
