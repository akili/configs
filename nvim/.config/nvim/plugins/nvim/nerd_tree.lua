-- https://github.com/preservim/nerdtree

vim.keymap.set('n', '<leader>n', ':NERDTreeFocus<CR>')
vim.keymap.set('n', '<leader>z', ':NERDTreeClose<CR>')
vim.keymap.set('n', '<C-t>', ':NERDTreeFind<CR>')
vim.keymap.set('n', '<F2>', ':NERDTreeRefreshRoot<CR> :NERDTreeToggle<CR>')
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeIgnore = {
    '\\.pyc$',
    '\\.pyo$',
    '__pycache__',
    '^venv$',
    '^env$',
    '^node_modules$',
    '^\\.venv$',
    '^\\.git$',
    '^\\.mypy_cache$',
    '^\\.pytest_cache$',
    '^\\.ruff_cache$',
    '^\\.tox$',
    '^\\.idea$',
    '^\\.vscode$',
    '^\\.DS_Store$',
}

-- https://github.com/Xuyuanp/nerdtree-git-plugin
vim.g.NERDTreeGitStatusUseNerdFonts = 1
