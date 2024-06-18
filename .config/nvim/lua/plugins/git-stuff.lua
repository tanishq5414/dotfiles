return {
  {
    'aaronhallaert/advanced-git-search.nvim',
    cmd = { "AdvancedGitSearch" }
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true
      })
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
    end
  }
}
