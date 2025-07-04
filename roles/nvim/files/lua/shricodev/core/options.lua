local opt = vim.opt -- For vim options
local window = vim.wo -- For window options
local global = vim.g -- For global options

global.mapleader = ' '
global.maplocalleader = ' '

-- Have nerd font available? Set this to true
global.have_nerd_font = true

-- recommended settings from nvim-tree documentation vim.g.loaded_netrw = 1
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- When using codeium.vim instead of codeium.nvim, use this
global.codeium_disable_bindings = 1

opt.winborder = 'rounded'

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.softtabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true -- copy indent from current line when starting new one

-- show number in current line and show relative number to all other lines
window.number = true
window.relativenumber = true

-- change the updatetime property to 50ms
opt.updatetime = 50

-- don't show mode as it is already in the statusline
opt.showmode = false

-- line wrapping
opt.wrap = false -- disable line wrapping

-- Enable break indent
opt.breakindent = true

-- Set highlight on search
opt.hlsearch = false

-- Save undo history
opt.undofile = true

opt.colorcolumn = '80' -- highlight column 80

-- Set completeopt to have a better completion experience
opt.completeopt = 'menu,menuone,noselect'

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '› ', trail = '·', nbsp = '␣' }

opt.termguicolors = true
opt.background = 'dark' -- colorschemes that can be light or dark will be made dark

-- always keep min 10 lines above and below the cursor
opt.scrolloff = 8

-- Preview substitutions live, as you type!
opt.incsearch = true
opt.inccommand = 'split'

opt.foldenable = true
opt.foldmethod = 'manual' -- Default fold method (change as needed)
opt.foldlevel = 99 -- Open most folds by default
opt.foldcolumn = '0'

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.signcolumn = 'yes' -- show sign column so that text doesn't shift

-- backspace
opt.backspace = { 'indent', 'eol', 'start' } -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
opt.backup = false

-- opt.spell = true
opt.spelllang = 'en_us'

-- cursor line
opt.cursorline = true -- highlight the current cursor line

opt.guicursor = ''
-- opt.guicursor = {
-- 'i-n-v-c:block', -- Normal, visual, command-line: block cursor
-- 've:ver25', -- Insert, visual-exclude: vertical bar cursor with 25% width
-- 'r-cr:hor20', -- Replace, command-line replace: horizontal bar cursor with 20% height
--   'o:hor50', -- Operator-pending: horizontal bar cursor with 50% height
-- }
