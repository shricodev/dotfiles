return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local harpoon = require("harpoon.mark")

    -- function that returns harpoon_marks based on if we are on a harpoon marked file.
    local function harpoon_component()
      local total_harpoon_marks = harpoon.get_length()
      if total_harpoon_marks == 0 then
        return ""
      end

      local current_mark = "—"
      local mark_index = harpoon.get_current_index()
      if mark_index ~= nil then
        current_mark = tostring(mark_index)
      end

      return string.format("󱡅 %s/%d", current_mark, total_harpoon_marks)
    end

    require("lualine").setup({
      options = {
        theme = "catppuccin",
        ignore_focus = { "NvimTree", "Outline" },
        always_divide_middle = true,
        globalstatus = false,
        icons_enabled = true,
        section_separators = { left = "", right = "" },
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
          { "mode" },
        },
        lualine_c = { "filename", harpoon_component },
        lualine_z = {
          { "location" },
          -- { "location", separator = { right = "" }, left_padding = 1 },
        },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
