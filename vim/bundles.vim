filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bitc/vim-bad-whitespace'
Bundle 'godlygeek/tabular'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-markdown'
Bundle 'tikhomirov/vim-glsl'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'wellle/targets.vim'
Bundle 'rhysd/vim-clang-format'
Bundle 'bear24rw/vim-llvm-syntax'

" re-enable settings that had to be disabled for vundle
filetype plugin indent on

" Powerline
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols = "compatible"

" Solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" Gundo toggle
nnoremap <F5> :GundoToggle<CR>

" Tabular shortcuts
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" CtrlP (only show Buffers + Files)
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_mruf_max = 0

autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
let g:clang_format#style_options = {
    \ "BasedOnStyle": "Google",
    \ "AlignEscapedNewlinesLeft": "false",
    \ "BinPackParameters": "false",
    \ "BreakBeforeBraces": "Linux",
    \ "IndentWidth": 4,
    \ "DerivePointerBinding": "false",
    \ "AlwaysBreakBeforeMultilineStrings": "false",
    \ "PenaltyBreakBeforeFirstCallParameter": 10000,
    \ "PointerBindsToType": "false"}
