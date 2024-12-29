return {
  'stevearc/oil.nvim',
  dependencies = { 'echasnovski/mini.icons' },
  keys = {
    { '<leader>e', '<CMD>Oil<CR>', desc = '[Oil]: Open parent directory' },
  },
  config = function()
    require('oil').setup {
      columns = { 'icon' },
      delete_to_trash = true,
      keymaps = {
        -- Used to move between splits in neovim
        ['<C-h>'] = false,
        ['<C-l>'] = false,
        ['<C-k>'] = false,
        ['<C-j>'] = false,

        ['<C-\\>'] = { 'actions.select', opts = { vertical = true } },
        ['<C-s>'] = { 'actions.select', opts = { horizontal = true } },
      },
      view_options = {
        show_hidden = true,
      },
    }
  end,
}
