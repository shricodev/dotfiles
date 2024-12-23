return {
  'stevearc/oil.nvim',
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

    vim.keymap.set('n', '<leader>ee', '<cmd>Oil<CR>', { desc = 'Open oil in parent directory' })
    vim.keymap.set('n', '<leader>ed', '<cmd>Oil<CR>', { desc = 'Open oil in project root directory' })
  end,
}
