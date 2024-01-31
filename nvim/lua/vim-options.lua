vim.g.mapleader = " "

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- show number in current line and show relative number to all other lines
vim.wo.number = true
vim.wo.relativenumber = true

-- line wrapping
vim.opt.wrap = false -- disable line wrapping

-- setup the cursor to block in all the modes
-- set guicursor=n-v-c-i:block

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
vim.opt.swapfile = false

-- cursor line
vim.opt.cursorline = true -- highlight the current cursor line

-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Move the selected text up and down, with J and K key.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the selected block of code down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the selected block of code up" })

-- Move text
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join the current line with below line with space as the delimeter" })

-- Move in the file half the screen.
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move in the file down half the screen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move in the file up half the screen" })

-- Search the file while keeping the search term in the center of the file.
vim.keymap.set("n", "n", "nzzzv", { desc = "Search the next occurance keeping the word in center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search the previous occurance keeping thhe word in center" })

-- Paste hack
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste the text while keeping it intact" })

-- Switch between different projects
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Quick Fix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Navigate to next quick fix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Navigate to prev quick fix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Navigate to next location list" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Navigate to prev location list" })

-- Change an occurance of a word in the entire file
vim.keymap.set(
  "n",
  "<leader>sw",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Change an occurance of the word in the file" }
)

-- Make a file executable right from the editor.
vim.keymap.set(
  "n",
  "<leader>x",
  "<cmd>!chmod +x %<CR>",
  { silent = true, desc = "Make a file executable right from the editor" }
)

-- Shortcut to open the config folder
vim.keymap.set(
  "n",
  "<leader>vpp",
  "<cmd>e ~/.config/nvim/lua/plugins<CR>",
  { desc = "Open the NVIM config lua plugins folder" }
)
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "make_it_run script" })

-- Setup the basic lsp-config keybinds
-- Setup some keybindings for code actions.
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Get the hover documentation" })

-- Setup the keybindings for neo-tree
vim.keymap.set("n", "<leader>ee", ":Neotree filesystem reveal left<CR>")
vim.keymap.set("n", "<leader>b", ":Neotree toggle<CR>", { desc = "Toggle NeoTree explorer" })

-- Setup the keybindings for the none-ls
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format the file" })

-- Setup the keybinds for the Harpoon plugin
vim.keymap.set(
  "n",
  "<leader>hm",
  "<cmd>lua require('harpoon.mark').add_file()<CR>",
  { desc = "Mark file with harpoon" }
)
vim.keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<CR>", { desc = "Go to next harpoon mark" })
vim.keymap.set(
  "n",
  "<leader>hp",
  "<cmd>lua require('harpoon.ui').nav_prev()<CR>",
  { desc = "Go to previous harpoon mark" }
)
vim.keymap.set("n", "<leader>hv", ":Telescope harpoon marks<CR>", { desc = "View all the harpoon marked files" })

-- Setup the keybinding for the auto-session plugin
vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for current working directory" }) -- save workspace session for current working directory

-- Setup the gitsigns plugins
vim.keymap.set("n", "<leader>ghp", ":Gitsigns preview_hunk<CR>", { desc = "View the Gitsigns hunk" })
vim.keymap.set(
  "n",
  "<leader>gt",
  ":Gitsigns toggle_current_line_blame<CR>",
  { desc = "Toggle the current line git blame" }
)

-- Setup the clipboard to work globally
vim.api.nvim_exec(
  [[
 if has('unnamedplus')
    set clipboard=unnamedplus
 else
    set clipboard=unnamed
 endif
]],
  false
)
