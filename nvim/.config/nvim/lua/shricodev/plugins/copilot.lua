return {
  'zbirenbaum/copilot.lua',
  -- cmd = 'Copilot',
  -- event = 'InsertEnter',
  enabled = false,
  config = function()
    require('copilot').setup {
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_next = '<c-j>',
          jump_prev = '<c-k>',
          accept = '<c-l>',
          refresh = 'r',
          open = '<M-CR>',
        },
        layout = {
          position = 'bottom', -- | top | left | right
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = '<c-l>',
          next = '<c-j>',
          prev = '<c-k>',
          dismiss = '<c-h>',
        },
      },
      filetypes = {
        markdown = true,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ['.'] = false,
      },
      copilot_node_command = 'node',
      server_opts_overrides = {},
    }
  end,
}
