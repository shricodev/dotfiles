local utils = require 'shricodev.utils'
local keymap_namer = utils.keymap_namer
local pname = utils.plugin_name()

require('gopher').setup {}

vim.keymap.set('n', '<leader>goj', '<CMD>GoTagAdd json<CR>', { desc = keymap_namer(pname, 'gotagadd json') })
vim.keymap.set('n', '<leader>goy', '<CMD>GoTagAdd yaml<CR>', { desc = keymap_namer(pname, 'gotagadd yaml') })
vim.keymap.set('n', '<leader>goi', '<CMD>GoIfErr<CR>', { desc = keymap_namer(pname, 'goiferr') })
