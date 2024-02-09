return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        ignore_focus = { "NvimTree" },
        always_divide_middle = true,
        globalstatus = false,
        section_separators = { left = "", right = "" },
        component_separators = { left = "|", right = "|" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
