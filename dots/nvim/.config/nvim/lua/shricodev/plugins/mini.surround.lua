local utils = require('shricodev.utils')
local keymap_namer = utils.keymap_namer
local pname = utils.plugin_name()

return {
  'nvim-mini/mini.surround',
  version = false,
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('mini.surround').setup {
      highlight_duration = 100,

      mappings = {
        add = 'ys',
        delete = 'ds',
        find = '',
        find_left = '',
        highlight = '',
        replace = 'cs',
        update_n_lines = '',

        -- Add this only if you don't want to use extended mappings
        suffix_last = '',
        suffix_next = '',
      },
      search_method = 'cover_or_next',
    }

    -- Remap adding surrounding to Visual mode selection
    vim.keymap.del('x', 'ys')
    vim.keymap.set(
      'x',
      'S',
      [[:<C-u>lua MiniSurround.add('visual')<CR>]],
      { silent = true, desc = keymap_namer(pname, 'add surrounding (visual)') }
    )

    -- Make special mapping for "add surrounding for line"
    vim.keymap.set('n', 'yss', 'ys_', { remap = true, desc = keymap_namer(pname, 'add surrounding for line') })
  end,
}
