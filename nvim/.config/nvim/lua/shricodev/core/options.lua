vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- show number in current line and show relative number to all other lines
vim.wo.number = true
vim.wo.relativenumber = true

-- change the updatetime property to 50ms
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.showmode = false -- don't show mode as it is already in the statusline

-- line wrapping
vim.opt.wrap = false -- disable line wrapping

-- Enable break indent
vim.opt.breakindent = true

-- Set highlight on search
vim.opt.hlsearch = true

-- Save undo history
vim.opt.undofile = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.termguicolors = true
vim.opt.background = 'dark' -- colorschemes that can be light or dark will be made dark

-- always keep min 8 lines above and below the cursor
vim.opt.scrolloff = 10

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

vim.opt.signcolumn = 'yes' -- show sign column so that text doesn't shift

-- backspace
vim.opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
vim.opt.swapfile = false

-- Concealer for Obsidian
vim.o.conceallevel = 2

-- cursor line
vim.opt.cursorline = true -- highlight the current cursor line

vim.opt.guicursor = {
  'n-v-c:block', -- Normal, visual, command-line: block cursor
  'i-ci-ve:ver25', -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  'r-cr:hor20', -- Replace, command-line replace: horizontal bar cursor with 20% height
  'o:hor50', -- Operator-pending: horizontal bar cursor with 50% height
}
