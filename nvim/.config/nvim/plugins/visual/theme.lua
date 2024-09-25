-- https://github.com/navarasu/onedark.nvim
require('onedark').setup {
    style = 'deep',
    colors = {
        fg = '#ffffff',
        grey = '#808080',
        purple = '#DA70D6',
        dark_purple = '#9370DB',
    },
    highlights = {
        Visual = {bg = '#6c7d9c'},
    },
}
require('onedark').load()
