local keymap_namer = require('shricodev.utils').keymap_namer

return {
  'szw/vim-maximizer',
  keys = {
    { '<leader>sm', '<cmd>MaximizerToggle<CR>', desc = keymap_namer('vim-maximizer', 'maximize/minimize a split') },
  },
}
