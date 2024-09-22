return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim" },
    config = function()
      local tscope = require("telescope.builtin")
      require("telescope").load_extension("git_worktree")
      require("telescope").load_extension("undo")
      require("telescope").load_extension("fzf")
      vim.keymap.set(
        "n",
        "<leader>wl",
        "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
        {}
      ) --list branches
      vim.keymap.set(
        "n",
        "<leader>wa",
        "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
        {}
      )                                                           --create branch
      vim.keymap.set("n", "<leader>ff", tscope.find_files, {})    --find files in the opened directory
      vim.keymap.set("n", "<leader>fg", tscope.live_grep, {})     --universal search
      vim.keymap.set("n", "<leader>fb", tscope.buffers, {})       --list buffers
      vim.keymap.set("n", "<leader>fh", tscope.help_tags, {})     --search help tags
      vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>") --search old files
      require("telescope").setup({
        extensions = {
          git_worktree = {
            disable_default_keybindings = true,
            disable_default_mappings = true,
          },
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          },
          undo = {
            keymaps = {
              start = "<c-u>",
              stop = "<c-r>",
            },
            -- debounce = 200,
            -- diff_opts = "--word-diff",
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            find_command = { "rg", "--files", "--hidden", "--glob", "!.git", "-u" },
          }
        },
        defaults = {
          vimgrep_arguments = {
            'rg', '--hidden', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column',
            '--smart-case' },
        },
      })
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
  {
    'dawsers/telescope-file-history.nvim',
    config = function()
      require('file_history').setup {
        -- This is the location where it will create your file history repository
        backup_dir = "~/.file-history-git",
        -- command line to execute git
        git_cmd = "git"
      }
      require('telescope').load_extension('file_history')
    end,
  },
  { 'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }

}
