local keymap = vim.keymap -- for conscise code

-- TIP: Disable arrow keys in normal mode
keymap.set('n', '<left>', '<cmd>echo "KEY DISABLED!"<CR>')
keymap.set('n', '<right>', '<cmd>echo "KEY DISABLED!"<CR>')
keymap.set('n', '<up>', '<cmd>echo "KEY DISABLED!"<CR>')
keymap.set('n', '<down>', '<cmd>echo "KEY DISABLED!"<CR>')

-- Disable using Backspace, to adapt to <C-w/u/h>
-- keymap.set('i', '<BS>', function()
--   vim.cmd 'echo "KEY DISABLED!"'
-- end, { noremap = true, silent = true })

-- Disable using Backspace in command mode as well, but don't echo anything
-- vim.keymap.set('c', '<BS>', '<Nop>', { noremap = true, silent = true })

-- use jk or kj to exit insert mode
keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

-- Yank to system clipboard using <Leader>y
keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { noremap = true, silent = true })
keymap.set('n', '<leader>Y', '"+Y', { noremap = true, silent = true })

-- Don't copy the cut out single character to the clipboard.>copy
-- keymap.set('n', 'x', '"_x', { desc = "Don't yank the cut out character to clipboard" })

keymap.set('v', '<leader>d', [["_d]], { desc = "Don't yank the (visual) cut out text to clipboard" })

-- In the cmd line mode, type %% to get the directory of the current file.
-- A tip from the Practical Vim book. typing :e %% is same as :e %:h<Tab>
vim.keymap.set('c', '%%', function()
  if vim.fn.getcmdtype() == ':' then
    return vim.fn.expand '%:h'
  else
    return '%%'
  end
end, { expr = true, desc = 'Get the directory of the current file (cmdline) mode' })

-- clear search highlights
keymap.set('n', '<leader>nh', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })
keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
keymap.set('n', '<leader>ss', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
keymap.set('n', '<leader>s=', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
keymap.set('n', '<leader>sc', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window
keymap.set('n', '<leader>sC', '<cmd>only<CR>', { desc = 'Close all other splits and only keep active one' }) -- close current split window

-- window size management
keymap.set('n', '<M-l>', '<cmd>vertical resize +5<CR>', { desc = 'Increase window size vertically' }) -- make the window biger vertically
keymap.set('n', '<M-h>', '<cmd>vertical resize -5<CR>', { desc = 'Decrease window size vertically' }) -- make the window smaller vertically
keymap.set('n', '<M-k>', '<cmd>horizontal resize +2<CR>', { desc = 'Increase window size horizontally' }) -- make the window bigger horizontally by pressing shift and =
keymap.set('n', '<M-j>', '<cmd>horizontal resize -2<CR>', { desc = 'Decrease window size horizontally' }) -- make the window smaller horizontally by pressing shift and -

-- tab management
keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
keymap.set('n', '<leader>tc', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab

-- Move the selected text up and down, with J and K key.
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move the selected lines down' })
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move the selected lines up' })

-- move in the top or down half of the screen.
keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move down half the screen in the file' })
keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move up half the screen in the file' })

-- Search the file while keeping the search term in the center of the file.
keymap.set('n', 'n', 'nzzzv', { desc = 'Search the next occurance keeping the word in center' })
keymap.set('n', 'N', 'Nzzzv', { desc = 'Search the previous occurance keeping the word in center' })

-- close buffer
keymap.set('n', '<leader>bc', '<cmd>bd<CR>', { desc = 'Close Buffer' })

-- Paste hack
keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste the text while keeping it intact' })

-- Copy file paths
keymap.set('n', '<leader>yfp', '<cmd>let @" = expand("%:p")<CR>', { noremap = true, silent = true, desc = 'Yank current file absolute path' })
keymap.set('n', '<leader>yfn', '<cmd>let @" = expand("%:t")<CR>', { noremap = true, silent = true, desc = 'Yank current file name' })

-- Stay in indent mode. Might return back to using this setting later.
-- Running . runs the same indentation we added/removed.
-- keymap.set('v', '<', '<gv', { desc = 'Left indent while staying in indent mode' })
-- keymap.set('v', '>', '>gv', { desc = 'Right indent while staying in indent mode' })

-- Quick Fix list
keymap.set('n', ']q', '<cmd>cnext<CR>zz', { desc = 'Navigate to next quick fix' })
keymap.set('n', '[q', '<cmd>cprev<CR>zz', { desc = 'Navigate to prev quick fix' })

-- Location List
-- Cannot use [l and ]l as they are already used in textobject for loop
-- keymap.set('n', '<leader>ln', '<cmd>lnext<CR>zz', { desc = 'Navigate to next location list' })
-- keymap.set('n', '<leader>lp', '<cmd>lprev<CR>zz', { desc = 'Navigate to prev location list' })

-- Change an occurance of a word in the entire file
keymap.set('n', '<leader>rw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Rename an occurance of the word in the file' })

-- Terminal keymaps
keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, desc = 'Change terminal mode from insert to normal' })
keymap.set('t', '<A-h>', '<C-\\><C-n><C-w>h', { noremap = true, desc = 'Move to the left terminal split' })
keymap.set('t', '<A-j>', '<C-\\><C-n><C-w>j', { noremap = true, desc = 'Move to the bottom terminal split' })
keymap.set('t', '<A-k>', '<C-\\><C-n><C-w>k', { noremap = true, desc = 'Move to the top terminal split' })
keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>l', { noremap = true, desc = 'Move to the right terminal split ' })
