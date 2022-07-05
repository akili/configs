call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    Plug 'lifepillar/vim-solarized8', { 'dir': '~/.config/nvim/colors/solarized8' }
    Plug 'majutsushi/tagbar'
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
call plug#end()

set termguicolors
set background=dark
colorscheme solarized8

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
" set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

let mapleader = " "

:au FocusLost * :wa

" open new split panes to right and below
set splitright
set splitbelow

" https://github.com/preservim/tagbar
nmap <F8> :TagbarToggle<CR>
" autocmd VimEnter *.py,*.pl,*.js,*.php TagbarToggle
let g:tagbar_compact = 1

" https://github.com/preservim/nerdtree
noremap <F6> :NERDTreeRefreshRoot<CR> :NERDTreeToggle<CR>

" https://github.com/vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
noremap <S-h> :bp<CR>
noremap <S-l> :bn<CR>
noremap <A-w> :bd<CR>

" https://github.com/preservim/nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>


