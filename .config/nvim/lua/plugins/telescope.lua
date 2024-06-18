return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local tscope = require("telescope.builtin")
            require("telescope").load_extension("git_worktree")
            vim.keymap.set("n", "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", {}) --list branches
            vim.keymap.set("n", "<leader>gwa", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", {}) --create branch
            vim.keymap.set("n", "<leader>ff", tscope.find_files, {}) --find files in the opened directory
            vim.keymap.set("n", "<leader>fg", tscope.live_grep, {}) --universal search
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
