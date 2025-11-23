-- Enable basic folding options
vim.o.foldlevel = 99          -- All folds open by default
vim.o.foldlevelstart = 99
vim.o.foldenable = true       -- Enable folding

-- UFO setup
require('ufo').setup({
  open_fold_hl_timeout = 150,
  close_fold_kinds_for_ft = { 'imports', 'comment' },
  provider_selector = function(bufnr, filetype, buftype)
    return { 'lsp', 'indent' }
  end,
})

-- Key mappings for convenience
vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, { desc = 'Open folds except some kinds' })
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith, { desc = 'Close folds with level' })

-- Save folds when leaving a buffer
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  command = "mkview",
})

-- Restore folds when entering a buffer
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  command = "silent! loadview",
})
