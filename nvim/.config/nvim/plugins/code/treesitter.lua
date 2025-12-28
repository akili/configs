require'nvim-treesitter.install'.compilers = { 'clang' }
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
