local keymap = vim.keymap -- for conscise code

-- TIP: Disable arrow keys in normal mode
keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- use jk or kj to exit insert mode
keymap.set('i', 'jk', '<ESC>', { desc = '[Mode]: Exit insert mode with jk' })
keymap.set('i', 'JK', '<ESC>', { desc = '[Mode]: Exit insert mode with JK' })

-- Don't copy the cut out single character to the clipboard.
keymap.set('n', 'x', '"_x', { desc = "[Text]: Don't copy the cut out character to clipboard" })
keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = "[Text]: Don't copy the cut out text to clipboard" })

-- clear search highlights
keymap.set('n', '<leader>nh', '<cmd>nohlsearch<CR>', { desc = '[Highlights]: Clear search highlights' })
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = '[Highlights]: Clear search highlights' })

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', { desc = '[Window]: Split window vertically' }) -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s', { desc = '[Window]: Split window horizontally' }) -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', { desc = '[Window]: Make splits equal size' }) -- make split windows equal width & height
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = '[Window]: Close current split' }) -- close current split window

-- window size management
keymap.set('n', '<M-l>', '<cmd>vertical resize +5<cr>', { desc = '[Window]: Increase window size vertically' }) -- make the window biger vertically
keymap.set('n', '<M-h>', '<cmd>vertical resize -5<cr>', { desc = '[Window]: Decrease window size vertically' }) -- make the window smaller vertically
keymap.set('n', '<M-i>', '<cmd>horizontal resize +2<cr>', { desc = '[Window]: Increase window size horizontally' }) -- make the window bigger horizontally by pressing shift and =
keymap.set('n', '<M-k>', '<cmd>horizontal resize -2<cr>', { desc = '[Window]: Decrease window size horizontally' }) -- make the window smaller horizontally by pressing shift and -

-- tab management
keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = '[Tab]: Open new tab' }) -- open new tab
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = '[Tab]: Close current tab' }) -- close current tab
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = '[Tab]: Go to next tab' }) --  go to next tab
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = '[Tab]: Go to previous tab' }) --  go to previous tab
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = '[Tab]: Open current buffer in new tab' }) --  move current buffer to new tab

-- Move the selected text up and down, with J and K key.
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = '[Text]: Move the selected lines down' })
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = '[Text]: Move the selected lines up' })

-- Jump between markdown headers.
keymap.set('n', '<leader>m]', [[/^##\+ .*<CR>]], { desc = '[Markdown]: Jump to next markdown header' })
keymap.set('n', '<leader>m[', [[?^##\+ .*<CR>]], { desc = '[Markdown]: Jump to previous markdown header' })

-- Join line
keymap.set('n', 'J', 'mzJ`z', { desc = '[Text]: Join the current line with below line with space as the delimeter' })

-- move in the top or down half of the screen.
keymap.set('n', '<C-d>', '<C-d>zz', { desc = '[Move]: Move in the file down half the screen' })
keymap.set('n', '<C-u>', '<C-u>zz', { desc = '[Move]: Move in the file up half the screen' })

-- Search the file while keeping the search term in the center of the file.
keymap.set('n', 'n', 'nzzzv', { desc = '[Search]: Search the next occurance keeping the word in center' })
keymap.set('n', 'N', 'Nzzzv', { desc = '[Search]: Search the previous occurance keeping the word in center' })

-- close buffer
keymap.set('n', '<leader>qb', '<cmd>bd<CR>', { desc = '[Buffer]: Close Buffer' })

-- Source the current file right from nvim
keymap.set('n', '<leader><leader>', function()
  vim.cmd 'so'
end, { desc = '[Source]: Source current file' })

-- Paste hack
keymap.set('x', '<leader>p', [["_dP]], { desc = '[Text]: Paste the text while keeping it intact' })

-- Copy file paths
keymap.set('n', '<leader>cf', '<cmd>let @+ = expand("%")<CR>', { desc = '[File]: Copy File Name' })
keymap.set('n', '<leader>cp', '<cmd>let @+ = expand("%:p")<CR>', { desc = '[File]: Copy File Path' })

-- Move to the start and end of the line. Remap the B and E keys.
keymap.set('n', 'E', '$', { noremap = true, desc = '[Move]: Move to the end of the line' })
keymap.set('n', 'B', '^', { noremap = true, desc = '[Move]: Move to the start of the line' })

-- Stay in indent mode
keymap.set('v', '<', '<gv', { desc = '[Indent]: Left indent while staying in indent mode' })
keymap.set('v', '>', '>gv', { desc = '[Indent]: Right indent while staying in indent mode' })

-- Quick Fix list
keymap.set('n', '<leader>qn', '<cmd>cnext<CR>zz', { desc = '[QuickFix]: Navigate to next quick fix' })
keymap.set('n', '<leader>qp', '<cmd>cprev<CR>zz', { desc = '[QuickFix]: Navigate to prev quick fix' })

-- Location List
keymap.set('n', '<leader>qk', '<cmd>lnext<CR>zz', { desc = '[LocationList]: Navigate to next location list' })
keymap.set('n', '<leader>qj', '<cmd>lprev<CR>zz', { desc = '[LocationList]: Navigate to prev location list' })

-- Change an occurance of a word in the entire file
keymap.set('n', '<leader>rw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[Rename]: Change an occurance of the word in the file' })

-- Shortcut to open the config folder
keymap.set('n', '<leader>pp', '<cmd>e ~/.config/nvim/<CR>', { desc = '[Config]: Open the NVIM config folder' })

-- Terminal keymaps
keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, desc = '[Terminal]: Change from insert to normal terminal mode' })
keymap.set('t', '<A-h>', '<C-\\><C-n><C-w>h', { noremap = true, desc = '[Terminal]: Move to the left split' })
keymap.set('t', '<A-j>', '<C-\\><C-n><C-w>j', { noremap = true, desc = '[Terminal]: Move to the bottom split' })
keymap.set('t', '<A-k>', '<C-\\><C-n><C-w>k', { noremap = true, desc = '[Terminal]: Move to the top split' })
keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>l', { noremap = true, desc = '[Terminal]: Move to the right ' })

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
