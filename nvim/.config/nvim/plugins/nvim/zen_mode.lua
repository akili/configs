-- https://github.com/folke/zen-mode.nvim

require("zen-mode").setup({
    window = {
        backdrop = 0.8,
        widht = 120,
    }
})

vim.api.nvim_set_keymap("n", "<A-z>", "<cmd>ZenMode<CR>", { noremap = true, silent = true })
