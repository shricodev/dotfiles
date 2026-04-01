local utils = require 'shricodev.utils'
local keymap_namer = utils.keymap_namer
local pname = utils.plugin_name()

require('fzf-lua').setup {
  oldfiles = {
    include_current_session = true,
  },
  previewers = {
    builtin = {
      -- fzf-lua is very fast, but it really struggled to preview a couple files
      -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
      -- It turns out it was Treesitter having trouble parsing the files.
      -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
      -- (Yes, I know you shouldn't have 100KB minified files in source control.)
      syntax_limit_b = 1024 * 100, -- 100KB
    },
  },
  winopts = {
    border = 'rounded',
    -- using bat_native or bat improves the performance.
    -- according to fzf-lua docs. see: https://github.com/ibhagwan/fzf-lua/wiki#how-do-i-get-maximum-performance-out-of-fzf-lua
    -- preview = { border = 'none' },
  },
  fzf_opts = { ['--cycle'] = true },
  files = {
    file_icons = true,
    color_icons = true,
  },
  keymap = {
    fzf = {
      -- mimic the telescope behavior
      ['ctrl-q'] = 'select-all+accept',
      ['ctrl-d'] = 'preview-page-down',
      ['ctrl-u'] = 'preview-page-up',
      ['f4'] = 'toggle-preview',
      ['f3'] = 'toggle-preview-wrap',
    },
  },
}

-- Keymaps
vim.keymap.set('n', '<leader>gb', function()
  require('fzf-lua').lgrep_curbuf()
end, { desc = keymap_namer(pname, 'fuzzily search in current buffer') })

vim.keymap.set('n', '<leader>gW', function()
  require('fzf-lua').grep_cWORD { hidden = true }
end, { desc = keymap_namer(pname, 'fuzzily search current WORD') })

vim.keymap.set('n', '<leader>gw', function()
  require('fzf-lua').grep_cword { hidden = true }
end, { desc = keymap_namer(pname, 'fuzzily search current word') })

vim.keymap.set('n', '<leader>g/', function()
  require('fzf-lua').live_grep_native { hidden = true }
end, { desc = keymap_namer(pname, 'fuzzily search string in the project (including hidden)') })

vim.keymap.set('n', '<leader>faf', function()
  require('fzf-lua').files { hidden = true, no_ignore = true }
end, { desc = keymap_namer(pname, 'fuzzily find files in the cwd (including hidden)') })

vim.keymap.set('n', '<leader>ff', function()
  require('fzf-lua').files { hidden = true }
end, { desc = keymap_namer(pname, 'fuzzily find files in the cwd') })

vim.keymap.set('n', '<leader>fb', function()
  require('fzf-lua').buffers()
end, { desc = keymap_namer(pname, 'fuzzily find buffers') })

vim.keymap.set('n', '<leader>fr', function()
  require('fzf-lua').oldfiles()
end, { desc = keymap_namer(pname, 'fuzzily find recent files') })

-- I already have fr for oldfiles, so I am using fzr for this kind of like
-- [fz]f [r]esume
vim.keymap.set('n', '<leader>fzr', function()
  require('fzf-lua').resume()
end, { desc = keymap_namer(pname, 'resume last fzf-lua search') })

vim.keymap.set('n', '<leader>fh', function()
  require('fzf-lua').help_tags()
end, { desc = keymap_namer(pname, 'fuzzily find help tags') })

vim.keymap.set('n', '<leader>fk', function()
  require('fzf-lua').keymaps {
    profile = 'ivy',
    winopts = {
      preview = { hidden = true },
    },
  }
end, { desc = keymap_namer(pname, 'fuzzily find keymaps') })

vim.keymap.set('n', '<leader>fm', function()
  require('fzf-lua').marks()
end, { desc = keymap_namer(pname, 'fuzzily find marks') })

vim.keymap.set('n', '<leader>fX', function()
  require('fzf-lua').diagnostics_workspace()
end, { desc = keymap_namer(pname, 'view the workspace diagnostics') })

vim.keymap.set('n', '<leader>fx', function()
  require('fzf-lua').diagnostics_document()
end, { desc = keymap_namer(pname, 'view the document diagnostics') })

-- making it gW to match gO for document symbols
vim.keymap.set('n', 'gW', function()
  require('fzf-lua').lsp_live_workspace_symbols()
end, { desc = keymap_namer(pname, 'view the workspace symbols') })

-- gO is by default, I want to use fzf-lua version one
vim.keymap.set('n', 'gO', function()
  require('fzf-lua').lsp_document_symbols()
end, { desc = keymap_namer(pname, 'view the document symbols') })

-- gra is by default for code actions. Overriding it to use fzf-lua
vim.keymap.set('n', 'gra', function()
  require('fzf-lua').lsp_code_actions {
    winopts = {
      preview = { hidden = true },
      relative = 'cursor',
      row = 1.01,
      col = 0,
      width = 0.4,
      height = 0.2,
    },
  }
end, { desc = keymap_namer(pname, 'view the code actions') })

vim.keymap.set('n', 'grt', function()
  require('fzf-lua').lsp_typedefs()
end, { desc = keymap_namer(pname, 'view the typedefs') })

vim.keymap.set('n', 'grd', function()
  require('fzf-lua').lsp_definitions()
end, { desc = keymap_namer(pname, 'view the definitions') })

-- This is the default nvim binding, which I am overriding here.
vim.keymap.set('n', 'z=', function()
  require('fzf-lua').spell_suggest {
    winopts = {
      relative = 'cursor',
      row = 1.01,
      col = 0,
      width = 0.2,
      height = 0.2,
    },
  }
end, { desc = keymap_namer(pname, 'spell suggestions') })

vim.keymap.set('n', '<leader>fn', function()
  require('fzf-lua').files { cwd = '$HOME/Documents/obsidian-notes/' }
end, { desc = keymap_namer(pname, 'fuzzily find notes') })

vim.keymap.set('n', '<leader>gn/', function()
  require('fzf-lua').live_grep_native { cwd = '$HOME/Documents/obsidian-notes/' }
end, { desc = keymap_namer(pname, 'fuzzily search notes') })

vim.keymap.set('n', '<leader><tab>', function()
  require('fzf-lua').builtin()
end, { desc = keymap_namer(pname, 'view the fzf-lua options') })

vim.keymap.set('n', '<leader>fp', function()
  require('fzf-lua').zoxide()
end, { desc = keymap_namer(pname, 'switch between multiple recent directories (not necessarily a project)') })
