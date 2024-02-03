return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggle_float = function()
      local Terminal = require("toggleterm.terminal").Terminal
      local float = Terminal:new({
        direction = "float",
      })
      return float:toggle()
    end

    require("toggleterm").setup({
      size = 13,
      -- This keybind does not need to be used. Ignore this binding and use the one defined below.
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = "1",
      start_in_insert = true,
      persist_size = true,
      direction = "horizontal",
      insert_mappings = true,
      close_on_exit = true,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    -- Setup the keybinding for the toggle-terminal plugin.
    vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Open a split terminal below" })
    vim.keymap.set("n", "<leader>tf", toggle_float, { desc = "Open a floating terminal" })
  end,
}
