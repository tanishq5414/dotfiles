return { 
    "m4xshen/autoclose.nvim", 
    name = "autoclose",
    priority = 1000,
    config = function()
        require('autoclose').setup {
            filetypes = {
            javascript = {'{', '[', '('},
            javascriptreact = {'{', '[', '('},
            typescript = {'{', '[', '('},
            typescriptreact = {'{', '[', '('},
            vue = {'{', '[', '('},
            html = {'{', '[', '('},
            css = {'{', '[', '('},
            scss = {'{', '[', '('},
            less = {'{', '[', '('},
            json = {'{', '[', '('},
            yaml = {'{', '[', '('},
            markdown = {'{', '[', '('},
            }
        }
    end
  }

