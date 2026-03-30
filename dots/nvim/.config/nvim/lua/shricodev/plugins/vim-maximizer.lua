local utils = require 'shricodev.utils'
local keymap_namer = utils.keymap_namer
local pname = utils.plugin_name()

vim.keymap.set('n', '<leader>sm', '<cmd>MaximizerToggle<CR>', { desc = keymap_namer(pname, 'maximize/minimize a split') })
