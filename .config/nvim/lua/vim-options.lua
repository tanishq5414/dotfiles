vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true

function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
Map("n", "<C-l>", "<C-w>l")
Map("t", "<C-h>", "<cmd>wincmd h<CR>")
Map("t", "<C-j>", "<cmd>wincmd j<CR>")
Map("t", "<C-k>", "<cmd>wincmd k<CR>")
Map("i","<C-BS>", "<C-w>")
Map("i","<C-h>", "<C-w>")
Map("t", "<C-l>", "<cmd>wincmd l<CR>")
Map("n", "<C-d>", "<C-d>zz")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
Map("n", "<C-u>", "<C-u>zz")
Map("n", "U", "<C-r>", { desc = "Redo" })
Map("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>")
Map("n", "<leader>gi", ":lua vim.lsp.buf.implementation()<CR>")
Map("n", "K", ":lua vim.lsp.buf.hover()<CR>")
Map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
Map("n", "<leader>gr", ":lua vim.lsp.buf.references()<CR>")
Map("n", "<leader>h",":nohlsearch<CR>")
Map("n","Y", 'va$"ay')
Map("i", "M-BS" ,"<C-o>db");
Map("i", "M-del" ,"<C-o>dw");
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

