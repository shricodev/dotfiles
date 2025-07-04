local keymap_namer = require('shricodev.utils').keymap_namer

return {
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
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
          end, { desc = keymap_namer('gitsigns', 'next hunk') })

          map('n', '[h', function()
            if vim.wo.diff then
              vim.cmd.normal { '[c', bang = true }
            else
              gitsigns.nav_hunk 'prev'
            end
          end, { desc = keymap_namer('gitsigns', 'previous hunk') })

          -- Actions
          -- map('n', '<leader>hs', gitsigns.stage_hunk, { desc = keymap_namer('gitsigns', 'stage hunk') })
          -- map('v', '<leader>hs', function()
          --   gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          -- end, { desc = keymap_namer('gitsigns', 'stage hunk') })

          map('n', '<leader>hR', gitsigns.reset_buffer, { desc = keymap_namer('gitsigns', 'reset buffer') })
          map('n', '<leader>hr', gitsigns.reset_hunk, { desc = keymap_namer('gitsigns', 'reset hunk') })
          map('v', '<leader>hr', function()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = keymap_namer('gitsigns', 'reset hunk') })

          -- map('n', '<leader>hu', gitsigns.stage_hunk, { desc = keymap_namer('gitsigns', 'undo stage hunk') })

          map('n', '<leader>hv', gitsigns.preview_hunk, { desc = keymap_namer('gitsigns', 'preview hunk') })

          -- map('n', '<leader>hb', function()
          --   gitsigns.blame_line { full = true }
          -- end, { desc = keymap_namer('gitsigns', 'blame line') })
          --
          -- map('n', '<leader>hd', gitsigns.diffthis, { desc = keymap_namer('gitsigns', 'diff this') })
          -- map('n', '<leader>hD', function()
          --   gitsigns.diffthis '~'
          -- end, { desc = keymap_namer('gitsigns', 'diff this ~') })
        end,
      }
    end,
  },
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G' },
    keys = {
      { '<leader>tg', ':tab +Git<CR>', desc = keymap_namer('fugitive', 'open fugitive in a new tab') },
    },
  },
}
