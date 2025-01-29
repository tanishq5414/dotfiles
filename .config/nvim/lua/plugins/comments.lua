return {
  "numToStr/Comment.nvim",
  lazy = true,  -- Lazy load the plugin
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      lazy = true,  -- Lazy load this plugin as well
    },
  },
  config = function()
    local wk = require "which-key"

    -- Add key mappings for comment toggle
    wk.register({
      ["<leader>/"] = {
        "<Plug>(comment_toggle_linewise_current)",
        desc = "Comment",
        hidden = true,
      },
    })

    wk.register({
      ["<leader>/"] = {
        "<Plug>(comment_toggle_linewise_visual)",
        mode = "v",
        desc = "Comment",
        hidden = true,
      },
    })

    vim.g.skip_ts_context_commentstring_module = true
    ---@diagnostic disable: missing-fields
    require("ts_context_commentstring").setup {
      enable_autocmd = false,
    }

    require("Comment").setup {
      padding = true,
      sticky = true,
      toggler = {
        line = "<C-_>",
        block = "gbc",
      },
      opleader = {
        line = "<C-_>",
        block = "gb",
      },
      extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
      },
      mappings = {
        basic = true,
        extra = true,
      },
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    }
  end,
}

