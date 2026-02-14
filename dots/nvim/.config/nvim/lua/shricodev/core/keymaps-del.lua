local keymap = vim.keymap

-- I'm deleting these keybinds because I'm using it with the fzf-lua
keymap.del('n', 'gO')
keymap.del({ 'n', 'x' }, 'gra')
