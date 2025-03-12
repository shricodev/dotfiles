-- Currently using fzf-lua diagnostics
return {
  'folke/trouble.nvim',
  enabled = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    focus = true,
  },
  cmd = 'Trouble',
  keys = {
    { '<leader>xw', '<cmd>Trouble diagnostics toggle<CR>', desc = '[Trouble]: Open trouble workspace diagnostics' },
    { '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', desc = '[Trouble]: Open trouble document diagnostics' },
  },
}
