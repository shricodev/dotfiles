local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

local keymap = vim.keymap

-- Disable using arrow keys
keymap.set('n', '<left>', '<Nop>', opts 'Disable left arrow key')
keymap.set('n', '<right>', '<Nop>', opts 'Disable right arrow key')
keymap.set('n', '<up>', '<Nop>', opts 'Disable up arrow key')
keymap.set('n', '<down>', '<Nop>', opts 'Disable down arrow key')

keymap.set('i', 'jk', '<ESC>', opts 'Exit insert mode with jk')
keymap.set('i', 'jj', '<ESC>', opts 'Exit insert mode with jj')

-- Sometimes when working if I need to enter the normal mode after typing
-- a character that requires using <shift> key, then mistakely it types Jk
keymap.set('i', 'Jk', '<ESC>', opts 'Exit insert mode with Jk')
keymap.set('i', 'Jj', '<ESC>', opts 'Exit insert mode with Jj')
keymap.set('i', 'JK', '<ESC>', opts 'Exit insert mode with JK')
keymap.set('i', 'JJ', '<ESC>', opts 'Exit insert mode with JJ')

keymap.set({ 'n', 'v' }, '<leader>y', '"+y', opts 'Yank to system clipboard')
keymap.set('n', '<leader>Y', '"+Y', opts 'Yank line to system clipboard')

keymap.set('v', '<leader>d', [["_d]], opts "Don't yank the cut out character(s) to clipboard")

-- Highlight management
keymap.set('n', '<leader>nh', '<cmd>nohlsearch<CR>', opts 'Clear search highlights')
keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>', opts 'Clear search highlights')

-- Line movement
-- keymap.set('n', 'H', '^', opts 'Go to the start of the line')
-- keymap.set('n', 'L', '$', opts 'Go to the end of the line')

-- Split management
keymap.set('n', '<leader>sv', '<C-w>v', opts 'Split window vertically')
keymap.set('n', '<leader>ss', '<C-w>s', opts 'Split window horizontally')
keymap.set('n', '<leader>s=', '<C-w>=', opts 'Equalize window sizes')
keymap.set('n', '<leader>sc', '<cmd>close<CR>', opts 'Close current window')
keymap.set('n', '<leader>sC', '<cmd>only<CR>', opts 'Close all windows except the current one')

-- Window size management
keymap.set('n', '<C-Up>', ':resize +2<CR>', opts 'Increase window height')
keymap.set('n', '<C-Down>', ':resize -2<CR>', opts 'Decrease window height')
keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts 'Decrease window width')
keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts 'Increase window width')

-- Tab management
keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', opts 'Open a new tab')
keymap.set('n', '<leader>tc', '<cmd>tabclose<CR>', opts 'Close the current tab')
keymap.set('n', '<leader>t;', '<cmd>tabn<CR>', opts 'Go to next tab')
keymap.set('n', '<leader>t,', '<cmd>tabp<CR>', opts 'Go to previous tab')
keymap.set('n', '<leader>t>', ':tabmove +1<CR>', opts 'Move tab right')
keymap.set('n', '<leader>t<', ':tabmove -1<CR>', opts 'Move tab left')

-- Buffer stuffs
keymap.set('n', '<leader>bc', '<cmd>bd<CR>', opts 'Close the current buffer')
keymap.set('n', '<leader>bp,', '<cmd>b#<CR>', opts 'Go to the last buffer')
-- There's no need to add b; for the next buffer as 'b#' and 'bn' don't really
-- work the same

-- Move the selected text up and down.
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts 'Move the selected lines up')
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts 'Move the selected lines down')

-- Same as J, K in visual mode, but for normal mode.
keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', opts 'Move line up')
keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', opts 'Move line down')

-- Move in the top or down half of the screen.
keymap.set('n', '<C-u>', '<C-u>zz', opts 'Move up half the screen in the file')
keymap.set('n', '<C-d>', '<C-d>zz', opts 'Move down half the screen in the file')

-- Search the file while keeping the search term in the center of the file.
keymap.set('n', 'n', 'nzzzv', opts 'Search the next occurance keeping the word in center')
keymap.set('n', 'N', 'Nzzzv', opts 'Search the previous occurance keeping the word in center')

-- Paste hack
keymap.set('x', '<leader>p', [["_dP]], opts 'Paste without yanking the cut out text')

-- Make file executable
keymap.set('n', '<leader>xx', '<cmd>!chmod +x %<CR>', opts 'Make the current file executable')

-- Copy file paths
keymap.set('n', '<leader>yfp', '<cmd>let @" = expand("%:p")<CR>', opts 'Yank current file absolute path')
keymap.set('n', '<leader>yfn', '<cmd>let @" = expand("%:t")<CR>', opts 'Yank current file name')

-- Terminal keymaps
keymap.set('t', '<Esc>', '<C-\\><C-n>', opts 'Change terminal mode to normal mode')
keymap.set('t', '<A-h>', '<C-\\><C-n><C-w>h', opts 'Move to the left terminal split')
keymap.set('t', '<A-j>', '<C-\\><C-n><C-w>j', opts 'Move to the bottom terminal split')
keymap.set('t', '<A-k>', '<C-\\><C-n><C-w>k', opts 'Move to the top terminal split')
keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>l', opts 'Move to the right terminal split')

-- In the cmd line mode, type %% to get the directory of the current file.
-- A tip from the Practical Vim book. typing :e %% is same as :e %:h<Tab>
keymap.set('c', '%%', function()
  if vim.fn.getcmdtype() == ':' then
    return vim.fn.expand '%:h'
  else
    return '%%'
  end
end, { expr = true, desc = 'Get the directory of the current file (cmdline) mode' })

-- Stay in indent mode. Might return back to using this setting later.
-- Running . runs the same indentation we added/removed.
keymap.set('v', '<', '<gv', opts 'Left indent while staying in indent mode')
keymap.set('v', '>', '>gv', opts 'Right indent while staying in indent mode')

-- keymap.set('n', 'x', '"_x', { desc = "Don't yank the cut out character to clipboard" })
