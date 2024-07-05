return {
  'hedyhli/outline.nvim',
  lazy = 'true',
  keys = { { '<leader>so', '<cmd>Outline<cr>', desc = '[Outline]: Toggle Symbols Outline' } },
  cmd = { 'Outline', 'OutlineOpen' },
  config = function()
    require('outline').setup {
      outline_window = {
        position = 'left',
      },
    }
  end,
}
