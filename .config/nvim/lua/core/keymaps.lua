vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-w>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<C-w>', { noremap = true, silent = true })
vim.keymap.set("n", "Y", '"ayy', { noremap = true, silent = true })

