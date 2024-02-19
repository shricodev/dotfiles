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
