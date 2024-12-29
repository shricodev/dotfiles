return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'echasnovski/mini.icons', 'meuter/lualine-so-fancy.nvim' },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    -- local harpoon = require 'harpoon.mark'

    -- function that returns harpoon_marks based on if we are on a harpoon marked file.
    -- local function harpoon_component()
    --   local total_harpoon_marks = harpoon.get_length()
    --   if total_harpoon_marks == 0 then
    --     return ''
    --   end
    --
    --   local current_mark = '—'
    --   local mark_index = harpoon.get_current_index()
    --   if mark_index ~= nil then
    --     current_mark = tostring(mark_index)
    --   end
    --
    --   return string.format('󱡅 %s/%d', current_mark, total_harpoon_marks)
    -- end

    require('lualine').setup {
      options = {
        theme = 'rose-pine',
        ignore_focus = { 'NvimTree', 'Outline', 'Neotree' },
        always_divide_middle = true,
        globalstatus = true,
        icons_enabled = true,
        section_separators = { left = '', right = '' },
        component_separators = { left = '|', right = '|' },
        disabled_filetypes = {
          statusline = {
            'alfa-nvim',
            'help',
            'neo-tree',
            'nvim-tree',
            'Trouble',
            'spectre_panel',
            'toggleterm',
            'oil',
          },
          winbar = {},
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      sections = {
        lualine_a = {
          { 'fancy_mode', width = 3 },
        },
        lualine_b = {
          'branch',
        },
        lualine_c = {
          {
            'filename',
            path = 0, -- 2 for full path
            symbols = {
              modified = '  ',
              -- readonly = "  ",
              -- unnamed = "  ",
            },
          },
          { 'fancy_diagnostics', sources = { 'nvim_lsp' }, symbols = { error = ' ', warn = ' ', info = ' ' } },
          { 'fancy_searchcount' },
        },
        lualine_z = {
          { 'location' },
        },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
