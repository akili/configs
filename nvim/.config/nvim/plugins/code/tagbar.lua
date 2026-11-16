-- https://github.com/preservim/tagbar

vim.api.nvim_set_keymap('n', '<F4>', ':TagbarToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tn', ':TagbarJumpNext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tp', ':TagbarJumpPrev<CR>', {noremap = true})
vim.g.tagbar_compact = 1
vim.g.tagbar_autofocus = 1
vim.g.tagbar_type_python = {
    kinds = {
        'i:imports:1',
        'c:classes',
        'f:functions',
        'm:members:1',
        'v:variables:1',
    },
}
