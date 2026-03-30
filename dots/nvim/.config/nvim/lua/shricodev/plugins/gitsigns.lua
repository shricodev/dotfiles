local utils = require 'shricodev.utils'
local keymap_namer = utils.keymap_namer
local pname = utils.plugin_name()

require('gitsigns').setup {
  signs = {
    add = { text = '│' },
    change = { text = '│' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '┆' },
  },
  signs_staged = {
    add = { text = '│' },
    change = { text = '│' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '┆' },
  },
  on_attach = function(bufnr)
    local gitsigns = require 'gitsigns'

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']h', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, { desc = keymap_namer(pname, 'next hunk') })

    map('n', '[h', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, { desc = keymap_namer(pname, 'previous hunk') })

    -- Actions
    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = keymap_namer(pname, 'reset buffer') })
    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = keymap_namer(pname, 'reset hunk') })
    map('v', '<leader>hr', function()
      gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, { desc = keymap_namer(pname, 'reset hunk') })

    map('n', '<leader>hv', gitsigns.preview_hunk, { desc = keymap_namer(pname, 'preview hunk') })
  end,
}
