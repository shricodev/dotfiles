local keymap = vim.keymap -- for conscise code

-- TIP: Disable arrow keys in normal mode
keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('i', '<BS>', function()
  vim.cmd 'echo "Backspace is not allowed in insert mode!!"'
end, { noremap = true, silent = true })

-- use jk or kj to exit insert mode
keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

-- Don't copy the cut out single character to the clipboard.>copy
keymap.set('n', 'x', '"_x', { desc = "Don't yank the cut out character to clipboard" })
keymap.set('v', '<leader>d', [["_d]], { desc = "Don't yank the cut out text to clipboard" })

-- clear search highlights
keymap.set('n', '<leader>nh', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })
keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

-- window size management
keymap.set('n', '<M-l>', '<cmd>vertical resize +5<cr>', { desc = 'Increase window size vertically' }) -- make the window biger vertically
keymap.set('n', '<M-h>', '<cmd>vertical resize -5<cr>', { desc = 'Decrease window size vertically' }) -- make the window smaller vertically
keymap.set('n', '<M-i>', '<cmd>horizontal resize +2<cr>', { desc = 'Increase window size horizontally' }) -- make the window bigger horizontally by pressing shift and =
keymap.set('n', '<M-k>', '<cmd>horizontal resize -2<cr>', { desc = 'Decrease window size horizontally' }) -- make the window smaller horizontally by pressing shift and -

-- tab management
keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab

-- Move the selected text up and down, with J and K key.
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move the selected lines down' })
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move the selected lines up' })

-- Jump between markdown headers.
keymap.set('n', '<leader>m]', [[/^##\+ .*<CR>]], { desc = 'Jump to next markdown header' })
keymap.set('n', '<leader>m[', [[?^##\+ .*<CR>]], { desc = 'Jump to previous markdown header' })

-- Join line
keymap.set('n', 'J', 'mzJ`z', { desc = 'Join the current line with below line with space as the delimeter' })

-- move in the top or down half of the screen.
keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move down half the screen in the file' })
keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move up half the screen in the file' })

-- Search the file while keeping the search term in the center of the file.
keymap.set('n', 'n', 'nzzzv', { desc = 'Search the next occurance keeping the word in center' })
keymap.set('n', 'N', 'Nzzzv', { desc = 'Search the previous occurance keeping the word in center' })

-- close buffer
keymap.set('n', '<leader>qb', '<cmd>bd<CR>', { desc = 'Close Buffer' })

-- Source the current file right from nvim
keymap.set('n', '<leader><leader>', function()
  vim.cmd 'so'
end, { desc = 'Source current file' })

-- Paste hack
keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste the text while keeping it intact' })

-- Copy file paths
keymap.set('n', '<leader>yp', '<cmd>let @" = expand("%:p")<CR>', { noremap = true, silent = true, desc = 'Yank current file absolute path' })
keymap.set('n', '<leader>yn', '<cmd>let @" = expand("%:t")<CR>', { noremap = true, silent = true, desc = 'Yank current file name' })

-- Move to the start and end of the line. Remap the B and E keys.
keymap.set('n', 'E', '$', { noremap = true, desc = 'Move to the end of the line' })
keymap.set('n', 'B', '^', { noremap = true, desc = 'Move to the start of the line' })

-- Stay in indent mode
keymap.set('v', '<', '<gv', { desc = 'Left indent while staying in indent mode' })
keymap.set('v', '>', '>gv', { desc = 'Right indent while staying in indent mode' })

-- Quick Fix list
keymap.set('n', '<leader>qn', '<cmd>cnext<CR>zz', { desc = 'Navigate to next quick fix' })
keymap.set('n', '<leader>qp', '<cmd>cprev<CR>zz', { desc = 'Navigate to prev quick fix' })

-- Location List
keymap.set('n', '<leader>qk', '<cmd>lnext<CR>zz', { desc = 'Navigate to next location list' })
keymap.set('n', '<leader>qj', '<cmd>lprev<CR>zz', { desc = 'Navigate to prev location list' })

-- Change an occurance of a word in the entire file
keymap.set('n', '<leader>rw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Rename an occurance of the word in the file' })

-- Shortcut to open the config folder
keymap.set('n', '<leader>pp', '<cmd>e ~/.config/nvim/<CR>', { desc = 'Open the NVIM config folder' })

-- Terminal keymaps
keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, desc = 'Change terminal mode from insert to normal' })
keymap.set('t', '<A-h>', '<C-\\><C-n><C-w>h', { noremap = true, desc = 'Move to the left terminal split' })
keymap.set('t', '<A-j>', '<C-\\><C-n><C-w>j', { noremap = true, desc = 'Move to the bottom terminal split' })
keymap.set('t', '<A-k>', '<C-\\><C-n><C-w>k', { noremap = true, desc = 'Move to the top terminal split' })
keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>l', { noremap = true, desc = 'Move to the right terminal split ' })

-- navigate to vault
vim.keymap.set('n', '<leader>oo', '<cmd>cd $HOME/Documents/Obsidian-Notes/<cr>', { noremap = true, desc = '[Obsidian]: Open Obsidian Vault' })

-- search for files in full vault
vim.keymap.set(
  'n',
  '<leader>os',
  '<cmd>Telescope find_files search_dirs={"$HOME/Documents/Obsidian-Notes/"}<cr>',
  { noremap = true, desc = '[Obsidian]: Search Obsidian Vault' }
)
vim.keymap.set(
  'n',
  '<leader>o/',
  '<cmd>Telescope live_grep search_dirs={"$HOME/Documents/Obsidian-Notes/"}<cr>',
  { noremap = true, desc = '[Obsidian]: Grep Obsidian Vault' }
)
