
 return
   {
     "nvim-treesitter/nvim-treesitter",
     build = ":TSUpdate",
     config = function()
      local tsconfig = require("nvim-treesitter.configs")
      tsconfig.setup({
        auto_install = true,
        highlight = { enable = true }, --this will add highlighting to the code
        indent = { enable = true } -- this will add auto-indent 
      })
     end
   }

