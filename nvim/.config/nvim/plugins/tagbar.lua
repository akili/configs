-- https://github.com/preservim/tagbar

vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tn', ':TagbarJumpNext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tp', ':TagbarJumpPrev<CR>', {noremap = true})
vim.g.tagbar_compact = 1
vim.g.tagbar_autofocus = 1
