local opt = vim.opt -- for vim options
local window = vim.wo -- for window options

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Have nerd font available? Set this to true
vim.g.have_nerd_font = true

-- recommended settings from nvim-tree documentation vim.g.loaded_netrw = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disable the default codeium key bindings.
vim.g.codeium_disable_bindings = 1

vim.g.python3_host_prog = '/usr/bin/python3'

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.smarttab = true
opt.autoindent = true -- copy indent from current line when starting new one

-- show number in current line and show relative number to all other lines
window.number = true
window.relativenumber = true

-- change the updatetime property to 50ms
opt.updatetime = 250
-- opt.timeoutlen = 500

-- don't show mode as it is already in the statusline
opt.showmode = false

-- line wrapping
opt.wrap = false -- disable line wrapping

-- Enable break indent
opt.breakindent = true

-- Set highlight on search
opt.hlsearch = true

-- Save undo history
opt.undofile = true

-- Set completeopt to have a better completion experience
opt.completeopt = 'menu,menuone,noselect'

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

opt.termguicolors = true
opt.background = 'dark' -- colorschemes that can be light or dark will be made dark

-- always keep min 10 lines above and below the cursor
opt.scrolloff = 10

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.signcolumn = 'yes' -- show sign column so that text doesn't shift

-- backspace
opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to remain independent.
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = 'unnamedplus' -- Sync with system clipboard

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- cursor line
opt.cursorline = true -- highlight the current cursor line

opt.guicursor = {
  'n-v-c:block', -- Normal, visual, command-line: block cursor
  'i-ci-ve:ver25', -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  'r-cr:hor20', -- Replace, command-line replace: horizontal bar cursor with 20% height
  'o:hor50', -- Operator-pending: horizontal bar cursor with 50% height
}
