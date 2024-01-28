vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.wo.number = true
vim.wo.relativenumber = true

-- Move the selected text up and down, with J and K key.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move text
vim.keymap.set("n", "J", "mzJ`z")

-- Move in the file half the screen.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search the file while keeping the search term in the center of the file.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste hack
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Switch between different projects
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Quick Fix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Change an occurance of a word in the entire file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make a file executable right from the editor.
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Shortcut to open the config folder
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/plugins<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Setup the basic lsp-config keybinds
-- Setup some keybindings for code actions.
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- Setup the keybindings for neo-tree
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
vim.keymap.set("n", "<leader>b", ":Neotree toggle<CR>")

-- Setup the keybindings for the none-ls
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})

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
