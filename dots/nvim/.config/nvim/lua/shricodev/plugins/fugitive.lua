local utils = require 'shricodev.utils'
local keymap_namer = utils.keymap_namer
local pname = utils.plugin_name()

vim.keymap.set('n', '<leader>tg', ':tab +Git<CR>', { desc = keymap_namer(pname, 'open fugitive in a new tab') })
