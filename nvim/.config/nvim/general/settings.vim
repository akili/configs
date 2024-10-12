" Global nvim settings

let mapleader = " "

set termguicolors
hi Normal guibg=NONE ctermbg=NONE " transparent background

filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting

set encoding=utf-8
set fileencoding=utf-8
set scrolloff=10
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set smartcase
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set smartindent             " Makes indenting smart
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set noswapfile              " disable creating swap file
set fileformat=unix
set hidden                  " Required to keep multiple buffers open multiple buffers
set formatoptions-=cro      " Stop newline continution of comments

:au FocusLost * :wa

" open new split panes to right and below
set splitright
set splitbelow

let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
