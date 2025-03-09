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
          end, { desc = '[Gitsigns]: Next hunk' })

          map('n', '[h', function()
            if vim.wo.diff then
              vim.cmd.normal { '[c', bang = true }
            else
              gitsigns.nav_hunk 'prev'
            end
          end, { desc = '[Gitsigns]: Previous hunk' })

          -- Actions
          -- map('n', '<leader>hs', gitsigns.stage_hunk, { desc = '[Gitsigns]: Stage hunk' })
          -- map('v', '<leader>hs', function()
          --   gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          -- end, { desc = '[Gitsigns]: Stage hunk' })

          map('n', '<leader>hR', gitsigns.reset_buffer, { desc = '[Gitsigns]: Reset buffer' })
          map('n', '<leader>hr', gitsigns.reset_hunk, { desc = '[Gitsigns]: Reset hunk' })
          map('v', '<leader>hr', function()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = '[Gitsigns]: Reset hunk' })

          -- map('n', '<leader>hu', gitsigns.stage_hunk, { desc = '[Gitsigns]: Undo stage hunk' })

          map('n', '<leader>hv', gitsigns.preview_hunk, { desc = '[Gitsigns]: Preview hunk' })

          -- map('n', '<leader>hb', function()
          --   gitsigns.blame_line { full = true }
          -- end, { desc = '[Gitsigns]: Blame line' })
          --
          -- map('n', '<leader>hd', gitsigns.diffthis, { desc = '[Gitsigns]: Diff this' })
          -- map('n', '<leader>hD', function()
          --   gitsigns.diffthis '~'
          -- end, { desc = '[Gitsigns]: Diff this ~' })
        end,
      }
    end,
  },
  { 'tpope/vim-fugitive', cmd = { 'Git', 'G' }, keys = {
    { '<leader>tg', ':tab +Git<CR>', desc = '[Fugitive]: Open fugitive in a new tab' },
  } },
  -- currently using it with tmux, so no need of this plugin in nvim
  -- {
  --   'kdheepak/lazygit.nvim',
  --   -- Pushing myself to use fugitive for git until I am comfortable.
  --   enabled = false,
  --   cmd = {
  --     'LazyGit',
  --     'LazyGitConfig',
  --     'LazyGitCurrentFile',
  --     'LazyGitFilter',
  --     'LazyGitFilterCurrentFile',
  --   },
  --   -- optional for floating window border decoration
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --   },
  --   -- setting the keybinding for LazyGit with 'keys' is recommended in
  --   -- order to load the plugin when the command is run for the first time
  --   keys = {
  --     { '<leader>lg', '<cmd>LazyGit<cr>', desc = '[Lazygit]: Open lazy git' },
  --   },
  -- },
}
