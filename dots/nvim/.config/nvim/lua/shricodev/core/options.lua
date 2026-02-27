local opt = vim.opt -- For vim options
local window = vim.wo -- For window options
local global = vim.g -- For global options

global.mapleader = ' '
global.maplocalleader = ' '

-- Currently using i3, so running x11, so ignore this wl-copy thing.
-- For now when using wayland, force wl-copy clipboard
-- global.clipboard = 'wl-copy'

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
opt.smartindent = true
opt.autoindent = true -- copy indent from current line when starting new one

-- show number in current line and show relative number to all other lines
window.number = true
window.relativenumber = true

-- change the updatetime property to 50ms
opt.updatetime = 50
-- don't autosave changes
opt.autowrite = false

-- don't show mode as it is already in the statusline
opt.showmode = false

-- line wrapping
opt.wrap = false -- disable line wrapping

-- Enable break indent
opt.breakindent = true

-- Set highlight on search
opt.hlsearch = true

opt.mouse = 'a'

-- Save undo history
opt.undofile = true
opt.undodir = vim.fn.expand '~/.vim/undodir' -- Undo directory
opt.showtabline = 1 -- Always show tabline (0=never, 1=when multiple tabs, 2=always)
opt.tabline = '' -- Use default tabline (empty string uses built-in)

-- Transparent tabline appearance
vim.cmd [[
  hi TabLineFill guibg=NONE ctermfg=242 ctermbg=NONE
]]

opt.colorcolumn = '80' -- highlight column 80
-- highlight matching brackets
opt.conceallevel = 0
opt.concealcursor = '' -- Don't hide cursor line markup

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noinsert,noselect'
-- opt.pumheight = 10 -- Popup menu height

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '› ', trail = '·', nbsp = '␣' }

opt.termguicolors = true
opt.background = 'dark' -- colorschemes that can be light or dark will be made dark

-- always keep min 8 lines above and below the cursor
opt.scrolloff = 8
-- always keep min 8 lines above and below the cursor
opt.sidescrolloff = 8

-- Preview substitutions live, as you type!
opt.incsearch = true
opt.inccommand = 'split'

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.signcolumn = 'yes' -- show sign column so that text doesn't shift

-- single line cmd height
opt.cmdheight = 1

-- backspace
opt.backspace = { 'indent', 'eol', 'start' } -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- opt.spell = true
opt.spelllang = 'en_us'

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- show hidden buffers
opt.hidden = true
opt.errorbells = false

-- don't autochange directories
opt.autochdir = false

opt.encoding = 'utf-8'

-- opt.guicursor = ''
-- opt.guicursor = {
--   'i-n-v-c:block', -- Normal, visual, command-line: block cursor
--   've:ver25', -- Insert, visual-exclude: vertical bar cursor with 25% width
--   'r-cr:hor20', -- Replace, command-line replace: horizontal bar cursor with 20% height
--   'o:hor50', -- Operator-pending: horizontal bar cursor with 50% height
-- }

opt.guicursor = 'n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175' -- cursor blinking and settings

opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- start with all folds open
opt.foldlevel = 99
opt.foldenable = true
opt.foldcolumn = '0'
