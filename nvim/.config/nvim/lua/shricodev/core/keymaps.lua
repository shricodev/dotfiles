-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- use jk to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

-- clear search highlights
vim.keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window
vim.keymap.set('n', '<leader>swr', '<cmd>bp|bd #<CR>', { desc = 'Close Buffer; Retain Split' }) -- Close buffer without closing split

-- Move the selected text up and down, with J and K key.
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move the selected block of code down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move the selected block of code up' })

-- Select all
vim.keymap.set('n', '==', 'gg<S-v>G')

-- Jump between markdown headers
vim.keymap.set('n', '<leader>gj', [[/^##\+ .*<CR>]], { desc = 'Jump to next markdown header' })
vim.keymap.set('n', '<leader>gk', [[?^##\+ .*<CR>]], { desc = 'Jump to previous markdown header' })

-- Move text
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join the current line with below line with space as the delimeter' })

-- Use <leader>b to toggle the nvim-tree
vim.keymap.set('n', '<leader>b', ':NvimTreeToggle<CR>', { desc = 'Toggle the Nvim-Tree explorer' })

-- Move in the file half the screen.
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move in the file down half the screen' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move in the file up half the screen' })

-- Search the file while keeping the search term in the center of the file.
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Search the next occurance keeping the word in center' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Search the previous occurance keeping the word in center' })

-- close buffer
vim.keymap.set('n', '<leader>q', '<cmd>bd<CR>', { desc = 'Close Buffer' })

-- Source the current file right from nvim
vim.keymap.set('n', '<leader><leader>', function()
  vim.cmd 'so'
end, { desc = 'Source current file' })

-- Paste hack
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste the text while keeping it intact' })

-- Copy file paths
vim.keymap.set('n', '<leader>cf', '<cmd>let @+ = expand("%")<CR>', { desc = 'Copy File Name' })
vim.keymap.set('n', '<leader>cp', '<cmd>let @+ = expand("%:p")<CR>', { desc = 'Copy File Path' })

-- Move to the start and end of the line. Remap the B and E keys.
vim.keymap.set('n', 'E', '$', { noremap = true })
vim.keymap.set('n', 'B', '^', { noremap = true })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Switch between projects
vim.keymap.set(
  'n',
  '<C-p>',
  ":lua require('telescope').extensions.projects.projects{}<CR>",
  { noremap = true, silent = true, desc = 'Switch between multiple projects' }
)

-- Options through Telescope
vim.keymap.set('n', '<leader><tab>', "<cmd>lua require('telescope.builtin').commands()<CR>", { desc = 'View Telescope options' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    previewer = false,
  })
end, { desc = 'Fuzzily search in current buffer' })

-- Use telescope to search the help tags
vim.keymap.set('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", { desc = 'Search the Help Documentation' })

-- Quick Fix list
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Navigate to next quick fix' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Navigate to prev quick fix' })

-- Location List
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Navigate to next location list' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Navigate to prev location list' })

-- Change an occurance of a word in the entire file
vim.keymap.set('n', '<leader>sw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Change an occurance of the word in the file' })

-- Make a file executable right from the editor.
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make a file executable right from the editor' })

-- Shortcut to open the config folder
vim.keymap.set('n', '<leader>vpp', '<cmd>e ~/.config/nvim/lua/plugins<CR>', { desc = 'Open the NVIM config lua plugins folder' })

-- Setup the basic lsp-config keybinds
-- Setup some keybindings for code actions.
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Get the hover documentation' })

-- Setup the keybindings for the none-ls
vim.keymap.set(
  { 'n', 'v' },
  '<leader>f',
  "<cmd>lua require('conform').format({lsp_fallback = true, timeout_ms = 500})<CR>",
  { desc = 'Format file or range (in visual mode)' }
)

-- Trigger linting for current file
vim.keymap.set('n', '<leader>l', "<cmd>lua require('lint').try_lint()<CR>", { desc = 'Trigger linting for current file' })

-- Setup the gitsigns plugins
vim.keymap.set('n', '<leader>ghv', ':Gitsigns preview_hunk<CR>', { desc = 'View the Gitsigns hunk' })
vim.keymap.set('n', '<leader>ghn', ':Gitsigns next_hunk<CR>', { desc = 'Goto Gitsigns next hunk' })
vim.keymap.set('n', '<leader>ghp', ':Gitsigns prev_hunk<CR>', { desc = 'Goto Gitsigns previous hunk' })
vim.keymap.set('n', '<leader>gt', ':Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle the current line git blame' })

-- Setup the keybindings for the telescope plugin.
vim.keymap.set('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", { desc = 'Fuzzy find files in the cwd' })
-- Also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = 'Fizzy find in Open Files' })
-- This is to also view the .env sort of files in the telescope find files ui
vim.keymap.set(
  'n',
  '<leader>faf',
  "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<CR>",
  { desc = 'Fuzzy find files in the cwd' }
)
vim.keymap.set('n', '<leader>fs', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { desc = 'Find string in cwd' })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Fuzzy find recent files' })
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor in cwd' })

vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Open a buffer' })

vim.keymap.set('n', '<leader>km', '<cmd>Telescope keymaps<CR>', { desc = 'View the keybindings' })
vim.keymap.set('n', '<leader>mv', '<cmd>Telescope marks<CR>', { desc = 'View  marks' })

vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<CR>', { desc = 'Git Branches' })

-- Obsidian
vim.keymap.set('n', '<leader>oc', "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", { desc = 'Obsidian Check Checkbox' })
vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianTemplate<CR>', { desc = 'Insert Obsidian Template' })
vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = 'Open in Obsidian App' })
vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = 'Show ObsidianBacklinks' })
vim.keymap.set('n', '<leader>ol', '<cmd>ObsidianLinks<CR>', { desc = 'Show ObsidianLinks' })
vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = 'Create New Note' })
vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = 'Search Obsidian' })
vim.keymap.set('n', '<leader>oq', '<cmd>ObsidianQuickSwitch<CR>', { desc = 'Quick Switch' })

-- LSP keybindings
local opts = { noremap = true, silent = true }

-- set keybinds
opts.desc = 'Show LSP references'
vim.keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts) -- show definition, references

opts.desc = 'Go to declaration'
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- go to declaration

opts.desc = 'Show LSP definitions'
vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts) -- show lsp definitions

opts.desc = 'Show LSP implementations'
vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts) -- show lsp implementations

opts.desc = 'Show LSP type definitions'
vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts) -- show lsp type definitions

opts.desc = 'See available code actions'
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

opts.desc = 'Smart rename'
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- smart rename

opts.desc = 'Show buffer diagnostics'
vim.keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts) -- show  diagnostics for file

opts.desc = 'Show line diagnostics'
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- show diagnostics for line

opts.desc = 'Go to previous diagnostic'
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

opts.desc = 'Go to next diagnostic'
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

opts.desc = 'Document Symbols'
vim.keymap.set('n', '<leader>ds', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)

opts.desc = 'Workspace Symbols'
vim.keymap.set('n', '<leader>ws', "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", opts)

opts.desc = 'Show documentation for what is under cursor'
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

opts.desc = 'Restart LSP'
vim.keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary
