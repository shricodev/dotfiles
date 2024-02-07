return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          path_display = { "truncate" },
          mappings = {
            i = {
              ["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
              ["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
              ["<C-q>"] = require("telescope.actions").send_selected_to_qflist
                + require("telescope.actions").open_qflist,
            },
          },
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown({}),
            },
          },
        },
      })
      local builtin = require("telescope.builtin")

      -- Setup the keybindings for the telescope plugin.
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in the cwd" })
      -- This is to also view the .env sort of files in the telescope find files ui
      vim.keymap.set(
        "n",
        "<leader>faf",
        "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<CR>",
        { desc = "Fuzzy find files in the cwd" }
      )
      vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
      vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
      vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

      require("telescope").load_extension("harpoon")
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
      -- require("telescope").load_extension("project_nvim")
    end,
  },
}
