source ~/.vimrc.plugs

set nocompatible                 " be improved
let mapleader = ' '

nnoremap <Leader><Space> :

" get rid of Ex mode
nnoremap Q <Nop>

set mouse=a                      " automatically enable mouse
set mousehide                    " hide mouse cursor when typing

" UI
set number                       " show line numbers
set background=dark
colorscheme elflord
highlight clear SignColumn       " signColumn(gutter) should match background
highlight clear LineNr           " current line number row will have same background color in relative mode
set cursorline                   " highlight current line
set showmatch                    " show matching brackets/parenthesis
set history=1000


" Highlight problematic whitespace
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set hlsearch                     " highlight search results
set incsearch                    " incremental search

" if 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase
" letter, it is case sensitive, otherwise, it is not
set ignorecase
set smartcase

" WRAPPING
set nowrap                       " do not wrap long lines
" move in a sane way when wrapping
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$
" shortcut for to wrap all lines at 80 characters without breaking any words,
" and preserve shorter lines:
nnoremap Q gqip

" yank from cursor to end of line (more consistent with A, C, D, etc.)
nnoremap Y y$

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NEOCOMPLETE: autocompletion
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15
" <TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
set completeopt-=preview          " don't open preview window all over the place

" GHCMOD: haskell type info and error checking
autocmd BufWritePost *.hs GhcModCheckAndLintAsync " check and lint on write

" NERDTREE: file browser
map <C-n> :NERDTreeToggle<CR>

" AIRLINE: status bar
set laststatus=2                  " don't wait for a split to appear for airline to be visible
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"set guifont=Liberation\ Mono\ for\ Powerline\ 10
"let g:Powerline_symbols = 'fancy'
"let g:airline_powerline_fonts=1   " use cool symbols

" vim-sensible enables smarttab. Here, we configure the rest:
" Set the display size of t characters
set tabstop=2
" When hitting , insert combination of t and spaces for this width.
" This combination is deleted as if it were 1 t when using backspace.
set softtabstop=2
" Set code-shifting width. Since smarttab is enabled, this is also the tab
" insert size for the beginning of a line.
set shiftwidth=2
" When inserting tab characters, use spaces instead
set expandtab
