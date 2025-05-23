call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

    " ---Visual---
    Plug 'navarasu/onedark.nvim'
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'

    " ---Code---
    Plug 'hrsh7th/nvim-cmp'

    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'majutsushi/tagbar'
    Plug 'hoschi/yode-nvim'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'windwp/nvim-autopairs'
    Plug 'kevinhwang91/promise-async'  " for nvim-ufo
    Plug 'kevinhwang91/nvim-ufo', {'do': ':UpdateRemotePlugins'}
    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/nvim-treesitter-context'
    Plug 'nvim-lua/plenary.nvim' " telescope dep
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' } " treesitter dep
    Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    " Git
    Plug 'rhysd/git-messenger.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'lewis6991/gitsigns.nvim'

    " ---Nvim improvements---
    Plug 'Pocco81/auto-save.nvim'
    Plug 'folke/zen-mode.nvim'
    Plug 'justinmk/vim-sneak'
    Plug 'preservim/nerdtree'
    Plug 'unblevable/quick-scope'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

" General settings, hotkeys from small plugins
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/hotkeys.vim
source $HOME/.config/nvim/general/hotkeys.lua

" Visual plugins
source $HOME/.config/nvim/plugins/visual/theme.lua
source $HOME/.config/nvim/plugins/airline.vim

" Codding helpers
source $HOME/.config/nvim/plugins/code/general.lua
source $HOME/.config/nvim/plugins/code/nvim-cmp.lua
source $HOME/.config/nvim/plugins/code/lsp.lua
source $HOME/.config/nvim/plugins/code/tagbar.lua
source $HOME/.config/nvim/plugins/code/yode-nvim.vim
source $HOME/.config/nvim/plugins/code/treesitter.lua
source $HOME/.config/nvim/plugins/code/autopairs.lua
source $HOME/.config/nvim/plugins/code/nvim-ufo.lua

" Git
source $HOME/.config/nvim/plugins/git/gitsigns.lua

" Nvim improvements
source $HOME/.config/nvim/plugins/nvim/auto_save.lua
source $HOME/.config/nvim/plugins/nvim/zen_mode.lua
source $HOME/.config/nvim/plugins/nvim/bclose.vim
source $HOME/.config/nvim/plugins/nvim/nerd_tree.lua
source $HOME/.config/nvim/plugins/quickscope.vim
source $HOME/.config/nvim/plugins/fzf.lua
