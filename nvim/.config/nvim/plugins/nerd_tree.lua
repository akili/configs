-- https://github.com/preservim/nerdtree

vim.keymap.set('n', '<leader>n', ':NERDTreeFocus<CR>')
vim.keymap.set('n', '<F2>', ':NERDTreeRefreshRoot<CR> :NERDTreeToggle<CR>')
vim.g.NERDTreeShowHidden = 1

