set nocompatible

syntax on
filetype indent plugin on
set autoindent

set wildmenu
set showcmd
set ruler
set laststatus=2
set confirm
set visualbell
set number

set hlsearch
set ignorecase
set smartcase
set showmatch

set nostartofline
set backspace=indent,eol,start

" Visual effects
colorscheme desert
set t_Co=256
set cursorline
hi CursorLine   cterm=bold ctermbg=235 ctermfg=NONE


" Indentation options
set shiftwidth=4
set softtabstop=4
set expandtab

" Useful mappings
nnoremap <C-L> :nohl<CR><C-L>
