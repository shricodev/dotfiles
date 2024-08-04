return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end)

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = '[Gitsigns]: Stage hunk' })
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[Gitsigns]: Stage hunk' })

        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = '[Gitsigns]: Reset hunk' })

        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[Gitsigns]: Reset hunk' })

        map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = '[Gitsigns]: Undo stage hunk' })

        map('n', '<leader>hv', gitsigns.preview_hunk, { desc = '[Gitsigns]: Preview hunk' })

        map('n', '<leader>hb', function()
          gitsigns.blame_line { full = true }
        end, { desc = '[Gitsigns]: Blame line' })

        map('n', '<leader>hd', gitsigns.diffthis, { desc = '[Gitsigns]: Diff this' })
        map('n', '<leader>hD', function()
          gitsigns.diffthis '~'
        end, { desc = '[Gitsigns]: Diff this ~' })

        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = '[Gitsigns]: Select hunk' })
      end,
    }
  end,
}
