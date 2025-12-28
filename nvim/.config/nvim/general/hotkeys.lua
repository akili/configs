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

-- Terminal inside nvim
keymap("n", "<leader>t", ":split | terminal<CR>", { silent = true })
keymap("n", "<leader>T", ":vsplit | terminal<CR>", { silent = true })
-- Floating terminal
vim.keymap.set("n", "<leader>ft", function()
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal",
    border = "rounded",
  })

  vim.fn.termopen(vim.o.shell)
  vim.cmd("startinsert")
end)
