call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    " Visual
    Plug 'navarasu/onedark.nvim'

    " Code
    Plug 'hrsh7th/nvim-cmp'
    Plug 'neovim/nvim-lspconfig'
    Plug 'majutsushi/tagbar'
    Plug 'hoschi/yode-nvim'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'jiangmiao/auto-pairs'

    " Nvim improvements
    Plug 'Pocco81/auto-save.nvim'
    Plug 'folke/zen-mode.nvim'
    Plug 'justinmk/vim-sneak'

    " Git
    Plug 'rhysd/git-messenger.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'f-person/git-blame.nvim'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    Plug 'preservim/nerdtree'
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
    Plug 'ryanoasis/vim-devicons'
    Plug 'unblevable/quick-scope'
    Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
    Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
    Plug 'nvim-tree/nvim-web-devicons'
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
source $HOME/.config/nvim/plugins/code/yode-nvim.vim

" Nvim improvements
source $HOME/.config/nvim/plugins/nvim/auto_save.lua
source $HOME/.config/nvim/plugins/nvim/zen_mode.lua
source $HOME/.config/nvim/plugins/nvim/bclose.vim

" plugins setings
source $HOME/.config/nvim/plugins/nerd_tree.lua
source $HOME/.config/nvim/plugins/airline.vim
source $HOME/.config/nvim/plugins/quickscope.vim
source $HOME/.config/nvim/plugins/toggle_lsp.lua
source $HOME/.config/nvim/plugins/git_blame.vim
source $HOME/.config/nvim/plugins/fzf.lua

"""Конфиги плагинов."""

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
