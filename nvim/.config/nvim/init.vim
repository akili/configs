call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    " Visual
    Plug 'navarasu/onedark.nvim'

    " Code
    Plug 'hrsh7th/nvim-cmp'
    Plug 'neovim/nvim-lspconfig'
    Plug 'majutsushi/tagbar'

    " Nvim improvements
    Plug 'Pocco81/auto-save.nvim'
    Plug 'folke/zen-mode.nvim'

    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'vim-airline/vim-airline'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/nvim-treesitter-context'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'hoschi/yode-nvim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ryanoasis/vim-devicons'
    Plug 'unblevable/quick-scope'
    Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
    Plug 'justinmk/vim-sneak'
    Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
    Plug 'nvim-tree/nvim-web-devicons'

    " Git
    Plug 'rhysd/git-messenger.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'f-person/git-blame.nvim'
call plug#end()

let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/hotkeys.vim
source $HOME/.config/nvim/general/hotkeys.lua

" Visual plugins
source $HOME/.config/nvim/plugins/visual/theme.lua

" Codding helpers
source $HOME/.config/nvim/plugins/code/nvim-cmp.lua
source $HOME/.config/nvim/plugins/code/lspconfig.lua
source $HOME/.config/nvim/plugins/code/tagbar.lua

" Nvim improvements
source $HOME/.config/nvim/plugins/nvim/auto_save.lua
source $HOME/.config/nvim/plugins/nvim/zen_mode.lua

" plugins setings
source $HOME/.config/nvim/plugins/nerd_tree.lua
source $HOME/.config/nvim/plugins/airline.vim
source $HOME/.config/nvim/plugins/quickscope.vim
source $HOME/.config/nvim/plugins/toggle_lsp.lua
source $HOME/.config/nvim/plugins/git_blame.vim
source $HOME/.config/nvim/plugins/fzf.lua

"""Конфиги плагинов."""

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
nnoremap <silent> <Leader>bd :Bclose<CR>



" Telescope settings
nnoremap ,f <cmd>Telescope find_files<cr>
nnoremap ,g <cmd>Telescope live_grep<cr>
" Telescope fzf plugin
lua << EOF
require('telescope').load_extension('fzf')
EOF


" Treesitter
lua << EOF
require'nvim-treesitter.install'.compilers = { 'clang' }

require'nvim-treesitter.configs'.setup({
    textobjects = {
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer'
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer'
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer'
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer'
            }
        }
    }
})

-- https://github.com/nvim-treesitter/nvim-treesitter-context
require'treesitter-context'.setup({
    enable = true,
    max_lines = 0,
    trim_scope = 'outer',
    patterns = {
        default = {
            'class',
            'function',
            'method',
        },
    },
    exact_patterns = {},
    zindex = 20,
    mode = 'cursor',
    separator = '-',
})

EOF

" https://github.com/rhysd/git-messenger.vim
nnoremap <C-g> :GitMessenger<CR>

" https://github.com/hoschi/yode-nvim
lua require('yode-nvim').setup({})
map <Leader>yc :YodeCreateSeditorFloating<CR>
map <Leader>yr :YodeCreateSeditorReplace<CR>
nmap <Leader>bd :YodeBufferDelete<cr>
imap <Leader>bd <esc>:YodeBufferDelete<cr>
" these commands fall back to overwritten keys when cursor is in split window
map <C-W>r :YodeLayoutShiftWinDown<CR>
map <C-W>R :YodeLayoutShiftWinUp<CR>
map <C-W>J :YodeLayoutShiftWinBottom<CR>
map <C-W>K :YodeLayoutShiftWinTop<CR>
" at the moment this is needed to have no gap for floating windows
set showtabline=2
