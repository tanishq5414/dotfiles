require("core.keymaps")
require("vim-options")

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Handle Backspace in insert mode
vim.keymap.set('i', '<C-BS>', '<C-w>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-h>', '<C-w>', { noremap = true, silent = true })

-- Yank the current line into the "a" register
vim.keymap.set("n", "Y", 'va$"ay', { noremap = true, silent = true }) -- Ensures compatibility with motions

--installing lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
