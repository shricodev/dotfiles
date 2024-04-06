local keymap = vim.keymap -- for conscise code

-- TIP: Disable arrow keys in normal mode
keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- use jk to exit insert mode
keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })
keymap.set('i', 'JK', '<ESC>', { desc = 'Exit insert mode with JK' })

-- increment/decrement numbers
-- I am making the Increment to have <leader>= and not <leader>+ because the + key needs to be hit with shift
keymap.set('n', '<leader>=', '<C-a>', { desc = 'Increment number' }) -- increment
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' }) -- decrement

-- clear search highlights
keymap.set('n', '<leader>nh', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window
keymap.set('n', '<leader>swr', '<cmd>bp|bd #<CR>', { desc = 'Close Buffer; Retain Split' }) -- Close buffer without closing split

keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab

-- Move the selected text up and down, with J and K key.
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move the selected block of code down' })
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move the selected block of code up' })

-- Select all
keymap.set('n', '==', 'gg<S-v>G')

-- Jump between markdown headers
keymap.set('n', '<leader>gj', [[/^##\+ .*<CR>]], { desc = 'Jump to next markdown header' })
keymap.set('n', '<leader>gk', [[?^##\+ .*<CR>]], { desc = 'Jump to previous markdown header' })

-- Move text
keymap.set('n', 'J', 'mzJ`z', { desc = 'Join the current line with below line with space as the delimeter' })

-- Move in the file half the screen.
keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move in the file down half the screen' })
keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move in the file up half the screen' })

-- Search the file while keeping the search term in the center of the file.
keymap.set('n', 'n', 'nzzzv', { desc = 'Search the next occurance keeping the word in center' })
keymap.set('n', 'N', 'Nzzzv', { desc = 'Search the previous occurance keeping the word in center' })

-- close buffer
keymap.set('n', '<leader>q', '<cmd>bd<CR>', { desc = 'Close Buffer' })

-- Source the current file right from nvim
keymap.set('n', '<leader><leader>', function()
  vim.cmd 'so'
end, { desc = 'Source current file' })

-- Paste hack
keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste the text while keeping it intact' })

-- Copy file paths
keymap.set('n', '<leader>cf', '<cmd>let @+ = expand("%")<CR>', { desc = 'Copy File Name' })
keymap.set('n', '<leader>cp', '<cmd>let @+ = expand("%:p")<CR>', { desc = 'Copy File Path' })

-- Move to the start and end of the line. Remap the B and E keys.
keymap.set('n', 'E', '$', { noremap = true, desc = 'Move to the end of the line' })
keymap.set('n', 'B', '^', { noremap = true, desc = 'Move to the start of the line' })

-- Stay in indent mode
keymap.set('v', '<', '<gv', { desc = 'Left indent while staying in indent mode' })
keymap.set('v', '>', '>gv', { desc = 'Right indent while staying in indent mode' })

-- Quick Fix list
keymap.set('n', '<leader>h', '<cmd>cnext<CR>zz', { desc = 'Navigate to next quick fix' })
keymap.set('n', '<leader>;', '<cmd>cprev<CR>zz', { desc = 'Navigate to prev quick fix' })

-- Location List
keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Navigate to next location list' })
keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Navigate to prev location list' })

-- Change an occurance of a word in the entire file
keymap.set('n', '<leader>sw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Change an occurance of the word in the file' })

-- Make a file executable right from the editor.
keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make a file executable right from the editor' })

-- Shortcut to open the config folder
keymap.set('n', '<leader>pp', '<cmd>e ~/.config/nvim/lua/plugins<CR>', { desc = 'Open the NVIM config lua plugins folder' })
