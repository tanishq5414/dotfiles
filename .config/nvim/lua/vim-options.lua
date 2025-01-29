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

local comment_map = {
    c = "//",
    cpp = "//",
    go = "//",
    java = "//",
    javascript = "//",
    lua = "--",
    scala = "//",
    php = "//",
    python = "#",
    ruby = "#",
    rust = "//",
    sh = "#",
    desktop = "#",
    fstab = "#",
    conf = "#",
    profile = "#",
    bashrc = "#",
    bash_profile = "#",
    mail = ">",
    eml = ">",
    bat = "REM",
    ahk = ";",
    vim = "\"",
    tex = "%",
}

function ToggleComment()
    local ft = vim.bo.filetype
    local comment_leader = comment_map[ft]
    if not comment_leader then
        print("No comment leader found for filetype: " .. ft)
        return
    end

    -- Check if we're in visual mode
    local mode = vim.api.nvim_get_mode().mode
    if mode == 'v' or mode == 'V' or mode == '' then
        -- Get the visual selection range and ensure start_line <= end_line
        local start_line = math.min(vim.fn.line("'<"), vim.fn.line("'>"))
        local end_line = math.max(vim.fn.line("'<"), vim.fn.line("'>"))
        -- Get all lines in selection
        local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
        -- Check if all lines are commented
        local all_commented = true
        for _, line in ipairs(lines) do
            local indent, content = line:match("^(%s*)(.*)")
            if content ~= "" and not content:match("^" .. vim.pesc(comment_leader) .. "%s?") then
                all_commented = false
                break
            end
        end
        -- Process all lines
        local new_lines = {}
        for _, line in ipairs(lines) do
            local indent, content = line:match("^(%s*)(.*)")
            if content ~= "" then  -- Skip empty lines
                if all_commented then
                    -- Uncomment
                    content = content:gsub("^" .. vim.pesc(comment_leader) .. "%s?", "")
                else
                    -- Comment
                    content = comment_leader .. " " .. content
                end
            end
            table.insert(new_lines, indent .. content)
        end
        -- Replace the lines
        vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, new_lines)
        -- Exit visual mode and restore cursor position
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
        vim.fn.cursor(start_line, 1)
    else
        -- Single line toggle
        local line = vim.api.nvim_get_current_line()
        local indent, content = line:match("^(%s*)(.*)")
        if content:match("^" .. vim.pesc(comment_leader) .. "%s?") then
            -- Uncomment the line
            content = content:gsub("^" .. vim.pesc(comment_leader) .. "%s?", "")
        else
            -- Comment the line
            content = comment_leader .. " " .. content
        end
        vim.api.nvim_set_current_line(indent .. content)
    end
end

vim.api.nvim_set_keymap('n', '<C-_>', "<cmd>lua ToggleComment()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-_>', "<cmd>lua ToggleComment()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-_>', "<cmd>lua ToggleComment()<CR>", { noremap = true, silent = true })
