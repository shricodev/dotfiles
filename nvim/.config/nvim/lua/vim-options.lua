vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- show number in current line and show relative number to all other lines
vim.wo.number = true
vim.wo.relativenumber = true

-- change the updatetime property to 50ms
vim.opt.updatetime = 50

-- line wrapping
vim.opt.wrap = false -- disable line wrapping

vim.opt.termguicolors = true
vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark

-- always keep min 8 lines above and below the cursor
vim.opt.scrolloff = 8

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
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search the previous occurance keeping the word in center" })

-- Paste hack
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste the text while keeping it intact" })

-- Switch between projects
vim.keymap.set(
  "n",
  "<C-p>",
  ":lua require('telescope').extensions.projects.projects()<CR>",
  { noremap = true, silent = true, desc = "Switch between multiple projects" }
)

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

-- Setup the basic lsp-config keybinds
-- Setup some keybindings for code actions.
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Get the hover documentation" })

-- Setup the keybindings for the none-ls
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
  })
end, { desc = "Format buffer with null-ls" })

-- Setup the gitsigns plugins
vim.keymap.set("n", "<leader>ghp", ":Gitsigns preview_hunk<CR>", { desc = "View the Gitsigns hunk" })
vim.keymap.set(
  "n",
  "<leader>gt",
  ":Gitsigns toggle_current_line_blame<CR>",
  { desc = "Toggle the current line git blame" }
)

-- Setup the keybindings for the bufferline plugin
vim.keymap.set("n", "<leader>fp", "<cmd>BufferLinePick<CR>", { desc = "Open a buffer" })

vim.opt.guicursor = {
  "n-v-c:block", -- Normal, visual, command-line: block cursor
  "i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  "r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
  "o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
  "a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}

-- Highlight the yanked area.
vim.api.nvim_command("highlight CustomYankColor guibg=#48aaf0 ctermbg=93")
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  desc = "Highlight selection on yank",
  callback = function()
    vim.highlight.on_yank({ higroup = "CustomYankColor", timeout = 150, visual = true })
  end,
})

-- Open the help window to the right
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("vertical_help", { clear = true }),
  pattern = "help",
  callback = function()
    vim.bo.bufhidden = "unload"
    vim.cmd.wincmd("L")
    vim.cmd.wincmd("=")
  end,
})

-- Enable spell checking and text wrapping for gitcommit, markdown and txt files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("edit_text", { clear = true }),
  pattern = { "gitcommit", "markdown", "txt" },
  desc = "Enable spell checking and text wrapping for certain filetypes",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Toggle LSP Diagnostics
vim.api.nvim_create_user_command("ToggleDiagnostics", function()
  if vim.g.diagnostics_enabled == nil then
    vim.g.diagnostics_enabled = false
    vim.diagnostic.disable()
  elseif vim.g.diagnostics_enabled then
    vim.g.diagnostics_enabled = false
    vim.diagnostic.disable()
  else
    vim.g.diagnostics_enabled = true
    vim.diagnostic.enable()
  end
end, {})
