vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set("n", "<C-BS>", "dw", {silent = true, desc = 'delete from cursor to ending word'})
vim.keymap.set("i", "<C-BS>", "dw", {silent = true, desc = 'delete from cursor to ending word'})
