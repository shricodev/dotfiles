return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '-', '<CMD>Oil<CR>', desc = '[Oil]: Open parent directory' },
  },
  config = function()
    require('oil').setup {
      columns = { 'icon' },
      delete_to_trash = true,
      keymaps = {
        ['<C-h>'] = false,
        ['<C-l'] = false,
      },
      view_options = {
        show_hidden = true,
      },
    }
  end,
}
