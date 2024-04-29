return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>xx', '<cmd>TroubleToggle<CR>', desc = '[Trouble]: Open/close trouble list' },
    { '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<CR>', desc = '[Trouble]: Open trouble workspace diagnostics' },
    { '<leader>xd', '<cmd>TroubleToggle document_diagnostics<CR>', desc = '[Trouble]: Open trouble document diagnostics' },
    { '<leader>xq', '<cmd>TroubleToggle quickfix<CR>', desc = '[Trouble]: Open trouble quickfix list' },
    { '<leader>xl', '<cmd>TroubleToggle loclist<CR>', desc = '[Trouble]: Open trouble location list' },
  },
}
