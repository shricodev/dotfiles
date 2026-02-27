local utils = require 'shricodev.utils'
local keymap_namer = utils.keymap_namer
local pname = utils.plugin_name()

return {
  'stevearc/oil.nvim',
  dependencies = { 'echasnovski/mini.icons' },
  -- Adding this keys option causes the plugin to load on key press and it cannot
  -- act as default_file_explorer, so need to ditch this setting
  -- keys = {
  --   { '<leader>e', '<CMD>Oil<CR>', desc = keymap_namer(pname, 'open parent directory') },
  -- },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      columns = { 'icon' },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      keymaps = {
        -- Used to move between splits in neovim
        ['<C-h>'] = false,
        ['<C-j>'] = false,
        ['<C-k>'] = false,
        ['<C-l>'] = false,

        ['-'] = { 'actions.parent', mode = 'n' },
        ['_'] = { 'actions.open_cwd', mode = 'n' },
        ['<C-\\>'] = { 'actions.select', opts = { vertical = true } },
        ['<C-s>'] = { 'actions.select', opts = { horizontal = true } },
      },
      view_options = {
        show_hidden = true,
        natural_order = 'fast',
      },
    }

    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = keymap_namer(pname, 'open parent directory') })
    vim.keymap.set('n', '_', function()
      require('oil.actions').open_cwd.callback()
    end, {
      desc = keymap_namer(pname, 'open current working directory (cwd)'),
    })
  end,
}
