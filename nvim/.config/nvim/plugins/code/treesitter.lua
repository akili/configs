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
