local utils = require('shricodev.utils')
local keymap_namer = utils.keymap_namer
local pname = utils.plugin_name()

return {
  'tpope/vim-fugitive',
  cmd = { 'Git', 'G' },
  keys = {
    { '<leader>tg', ':tab +Git<CR>', desc = keymap_namer(pname, 'open fugitive in a new tab') },
  },
}
