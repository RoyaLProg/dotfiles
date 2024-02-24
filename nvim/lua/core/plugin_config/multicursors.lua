require("multicursors").setup({})

vim.keymap.set('n', '<C-d>', ':MCstart<CR>', {})
vim.keymap.set('n', '<Leader>c', ':MCunderCursor<CR>', {})
