return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
	},
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle right<CR>")
    require("neo-tree").setup({
      auto_close = true,
      update_to_buf_dir = {
        enable = true,
      },
      view = {
        width = 30,
        side = "right",
        auto_resize = true,
      },
      ignore = { ".git", "node_modules", ".cache" },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignore = false,
        }
      }
    })
	end,
}
