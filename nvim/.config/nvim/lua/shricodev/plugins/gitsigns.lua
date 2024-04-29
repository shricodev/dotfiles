return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map('n', ']h', gs.next_hunk, '[Gitsigns]: Next Hunk')
      map('n', '[h', gs.prev_hunk, '[Gitsigns]: Prev Hunk')

      -- Actions
      map('n', '<leader>hs', gs.stage_hunk, '[Gitsigns]: Stage hunk')
      map('n', '<leader>hr', gs.reset_hunk, '[Gitsigns]: Reset hunk')

      map('v', '<leader>hs', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, '[Gitsigns]: Stage hunk')

      map('v', '<leader>hr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, '[Gitsigns]: Reset hunk')

      map('n', '<leader>hu', gs.undo_stage_hunk, '[Gitsigns]: Undo stage hunk')

      map('n', '<leader>hv', gs.preview_hunk, '[Gitsigns]: Preview hunk')

      map('n', '<leader>hb', function()
        gs.blame_line { full = true }
      end, '[Gitsigns]: Blame line')

      map('n', '<leader>hB', gs.toggle_current_line_blame, '[Gitsigns]: Toggle line blame')

      map('n', '<leader>hd', gs.diffthis, '[Gitsigns]: Diff this')
      map('n', '<leader>hD', function()
        gs.diffthis '~'
      end, '[Gitsigns]: Diff this ~')
    end,
  },
}
