local keymap = vim.keymap -- for conscise code

-- TIP: Disable arrow keys in normal mode
keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- use jk to exit insert mode
keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })
keymap.set('i', 'JK', '<ESC>', { desc = 'Exit insert mode with JK' })

-- clear search highlights
keymap.set('n', '<leader>nh', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window
keymap.set('n', '<leader>swr', '<cmd>bp|bd #<CR>', { desc = 'Close Buffer; Retain Split' }) -- Close buffer without closing split

-- Move the selected text up and down, with J and K key.
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move the selected block of code down' })
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move the selected block of code up' })

-- Select all
keymap.set('n', '==', 'gg<S-v>G')

-- Jump between markdown headers
keymap.set('n', '<leader>gj', [[/^##\+ .*<CR>]], { desc = 'Jump to next markdown header' })
keymap.set('n', '<leader>gk', [[?^##\+ .*<CR>]], { desc = 'Jump to previous markdown header' })

-- Move text
keymap.set('n', 'J', 'mzJ`z', { desc = 'Join the current line with below line with space as the delimeter' })

-- Use <leader>b to toggle the nvim-tree
keymap.set('n', '<leader>b', ':NvimTreeToggle<CR>', { desc = 'Toggle the Nvim-Tree explorer' })
keymap.set('n', '<leader>bf', ':NvimTreeFindFileToggle<CR>', { desc = 'Toggle the Nvim-Tree explorer on the current file' })

-- Move in the file half the screen.
keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move in the file down half the screen' })
keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move in the file up half the screen' })

-- Search the file while keeping the search term in the center of the file.
keymap.set('n', 'n', 'nzzzv', { desc = 'Search the next occurance keeping the word in center' })
keymap.set('n', 'N', 'Nzzzv', { desc = 'Search the previous occurance keeping the word in center' })

-- close buffer
keymap.set('n', '<leader>q', '<cmd>bd<CR>', { desc = 'Close Buffer' })

-- Source the current file right from nvim
keymap.set('n', '<leader><leader>', function()
  vim.cmd 'so'
end, { desc = 'Source current file' })

-- Paste hack
keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste the text while keeping it intact' })

-- Copy file paths
keymap.set('n', '<leader>cf', '<cmd>let @+ = expand("%")<CR>', { desc = 'Copy File Name' })
keymap.set('n', '<leader>cp', '<cmd>let @+ = expand("%:p")<CR>', { desc = 'Copy File Path' })

-- Move to the start and end of the line. Remap the B and E keys.
keymap.set('n', 'E', '$', { noremap = true })
keymap.set('n', 'B', '^', { noremap = true })

-- Stay in indent mode
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- Switch between projects
keymap.set(
  'n',
  '<C-p>',
  ":lua require('telescope').extensions.projects.projects{}<CR>",
  { noremap = true, silent = true, desc = 'Switch between multiple projects' }
)

-- Options through Telescope
keymap.set('n', '<leader><tab>', "<cmd>lua require('telescope.builtin').commands()<CR>", { desc = 'View Telescope options' })
keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<CR>', { desc = 'Find TODOS' })

-- Slightly advanced example of overriding default behavior and theme
keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    previewer = false,
  })
end, { desc = 'Fuzzily search in current buffer' })

-- Search in Open Files
keymap.set('n', '<leader>s/', function()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = 'Fuzzily search in Open Files' })

-- Shortcut for searching your Neovim configuration files
keymap.set('n', '<leader>sn', function()
  require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Fuzzily find Neovim config' })

-- Use telescope to search the help tags
keymap.set('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", { desc = 'Search the Help Documentation' })

-- Quick Fix list
keymap.set('n', '<leader>h', '<cmd>cnext<CR>zz', { desc = 'Navigate to next quick fix' })
keymap.set('n', '<leader>;', '<cmd>cprev<CR>zz', { desc = 'Navigate to prev quick fix' })

-- Location List
keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Navigate to next location list' })
keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Navigate to prev location list' })

-- Change an occurance of a word in the entire file
keymap.set('n', '<leader>sw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Change an occurance of the word in the file' })

-- Make a file executable right from the editor.
keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make a file executable right from the editor' })

-- Shortcut to open the config folder
keymap.set('n', '<leader>vpp', '<cmd>e ~/.config/nvim/lua/plugins<CR>', { desc = 'Open the NVIM config lua plugins folder' })

-- Setup the basic lsp-config keybinds
-- Setup some keybindings for code actions.
keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Get the hover documentation' })

-- Setup the keybindings for the none-ls
keymap.set(
  { 'n', 'v' },
  '<leader>f',
  "<cmd>lua require('conform').format({lsp_fallback = true, timeout_ms = 500})<CR>",
  { desc = 'Format file or range (in visual mode)' }
)

-- Trigger linting for current file
keymap.set('n', '<leader>l', "<cmd>lua require('lint').try_lint()<CR>", { desc = 'Trigger linting for current file' })

-- Setup the gitsigns plugins
keymap.set('n', '<leader>hv', ':Gitsigns preview_hunk<CR>', { desc = 'View the Gitsigns hunk' })
keymap.set('n', '<leader>hn', ':Gitsigns next_hunk<CR>', { desc = 'Goto Gitsigns next hunk' })
keymap.set('n', '<leader>hp', ':Gitsigns prev_hunk<CR>', { desc = 'Goto Gitsigns previous hunk' })
keymap.set('n', '<leader>hb', "<cmd>lua require('gitsigns').blame_line({full = true})<CR>", { desc = 'Blame Line' })
keymap.set('n', '<leader>hB', ':Gitsigns toggle_line_blame<CR>', { desc = 'Toggle line blame' })

-- Setup the keybindings for the telescope plugin.
keymap.set('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", { desc = 'Fuzzy find files in the cwd' })
-- Also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
keymap.set('n', '<leader>s/', function()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = 'Fizzy find in Open Files' })
-- This is to also view the .env sort of files in the telescope find files ui
keymap.set(
  'n',
  '<leader>faf',
  "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<CR>",
  { desc = 'Fuzzy find files in the cwd' }
)
keymap.set('n', '<leader>fs', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { desc = 'Find string in cwd' })
keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Fuzzy find recent files' })
keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor in cwd' })

keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Open a buffer' })

keymap.set('n', '<leader>km', '<cmd>Telescope keymaps<CR>', { desc = 'View the keybindings' })
keymap.set('n', '<leader>mv', '<cmd>Telescope marks<CR>', { desc = 'View  marks' })

keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<CR>', { desc = 'Git Branches' })

-- Obsidian
keymap.set('n', '<leader>oc', "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", { desc = 'Obsidian Check Checkbox' })
keymap.set('n', '<leader>ot', '<cmd>ObsidianTemplate<CR>', { desc = 'Insert Obsidian Template' })
keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = 'Open in Obsidian App' })
keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = 'Show ObsidianBacklinks' })
keymap.set('n', '<leader>ol', '<cmd>ObsidianLinks<CR>', { desc = 'Show ObsidianLinks' })
keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = 'Create New Note' })
keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = 'Search Obsidian' })
keymap.set('n', '<leader>oq', '<cmd>ObsidianQuickSwitch<CR>', { desc = 'Quick Switch' })

-- LSP keybindings
local opts = { noremap = true, silent = true }

-- set keybinds
opts.desc = 'Show LSP references'
keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts) -- show definition, references

opts.desc = 'Go to declaration'
keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- go to declaration

opts.desc = 'Show LSP definitions'
keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts) -- show lsp definitions

opts.desc = 'Show LSP implementations'
keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts) -- show lsp implementations

opts.desc = 'Show LSP type definitions'
keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts) -- show lsp type definitions

opts.desc = 'See available code actions'
keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

opts.desc = 'Smart rename'
keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- smart rename

opts.desc = 'Show buffer diagnostics'
keymap.set('n', '<leader>e', '<cmd>Telescope diagnostics bufnr=0<CR>', opts) -- show  diagnostics for file

opts.desc = 'Show line diagnostics'
keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- show diagnostics for line

opts.desc = 'Go to previous diagnostic'
keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

opts.desc = 'Go to next diagnostic'
keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

opts.desc = 'Document Symbols'
keymap.set('n', '<leader>ds', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)

opts.desc = 'Workspace Symbols'
keymap.set('n', '<leader>ws', "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", opts)

opts.desc = 'Show documentation for what is under cursor'
keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

opts.desc = 'Restart LSP'
keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary

keymap.set('n', '<C-s>', ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
