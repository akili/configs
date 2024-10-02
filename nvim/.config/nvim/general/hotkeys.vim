" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>

inoremap jk <Esc>

" Use alt + hjkl to resize windows
nnoremap <S-down>   :resize -2<CR>
nnoremap <S-up>     :resize +2<CR>
nnoremap <S-right>  :vertical resize +2<CR>
nnoremap <S-left>   :vertical resize -2<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Use control-c instead of escape
nnoremap <C-c> <Esc>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Close tab
noremap <A-w> :bd<CR>

" Macros automatization
noremap <A-q> :'<,'>normal @a<CR>

" Fix bug with wide cmd line
noremap <leader>w :wincmd _<CR>

" ---- Coding helpers ----

" run current script with python3 by CTRL+R in command and insert mode
autocmd FileType python map <buffer> <C-r> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <C-r> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
