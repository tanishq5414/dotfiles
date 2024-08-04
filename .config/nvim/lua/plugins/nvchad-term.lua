return {
	"NvChad/nvterm",
	config = function()
	  local terminal = 	require("nvterm").setup()
    vim.keymap.set("n", "<A-i>", "<cmd>lua require('nvterm.terminal').toggle('float')<CR>")
    vim.keymap.set("t", "<A-i>", "<cmd>lua require('nvterm.terminal').toggle('float')<CR>")
  end,
}
