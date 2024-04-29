return {
  'NeogitOrg/neogit',
  keys = {
    { '<leader>gs', ':Neogit<CR>', desc = '[Neogit]: Neogit Open' },
    { '<leader>gc', ':Neogit commit<CR>', desc = '[Neogit]: Neogit Commit' },
    { '<leader>gp', ':Neogit pull<CR>', desc = '[Neogit]: Neogit Pull' },
    { '<leader>gP', ':Neogit push<CR>', desc = '[Neogit]: Neogit Push' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    'nvim-telescope/telescope.nvim', -- optional
  },
  config = true,
}
