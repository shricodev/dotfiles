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
          winblend = 0,
          prompt_prefix = "   ",
          border = {},
          initial_mode = "insert",
          selection_caret = "⮞ ",
          entry_prefix = "  ",
          file_ignore_patterns = { "node_modules", ".git" },
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          path_display = { "truncate" },
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = {
            i = {
              ["<Esc>"] = require("telescope.actions").close,
              ["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
              ["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
              ["<C-q>"] = require("telescope.actions").send_selected_to_qflist
                + require("telescope.actions").open_qflist,
            },
            n = { ["q"] = require("telescope.actions").close },
          },
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown({}),
            },
          },
        },
      })

      require("telescope").load_extension("harpoon")
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
    end,
  },
}
