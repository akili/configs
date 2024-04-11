local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)
