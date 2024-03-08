return {
  'rmagatti/auto-session',
  lazy = true,
  keys = {
    {
      '<leader>sr',
      '<cmd>SessionRestore<CR>',
      desc = 'Restore session for cwd',
    },
    {
      '<leader>ss',
      '<cmd>SessionSave<CR>',
      desc = 'Save session for current working directory',
    },
  },
  config = function()
    local auto_session = require 'auto-session'
    auto_session.setup {
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { '~/', '~/Downloads', '~/Documents', '~/Desktop' },
    }
  end,
}
