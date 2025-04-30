-- Toggle diagnostic
vim.keymap.set('n', '<leader>d', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })

-- Diagnostic settings
vim.diagnostic.config({
  virtual_text = true,       -- show error message to the right of the line
  virtual_lines = false,     -- disable duplicated message below the line
  signs = true,              -- enable signs in the sign column
  underline = true,          -- underline the problematic code
  update_in_insert = false,  -- do not show diagnostics while typing
})

