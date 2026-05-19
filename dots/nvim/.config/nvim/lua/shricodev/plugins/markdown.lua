require('obsidian').setup {
  legacy_commands = false,
  ui = {
    enable = false,
  },
  workspaces = {
    {
      name = 'obsidian-notes',
      path = '~/Documents/obsidian-notes',
    },
  },
}

require('render-markdown').setup {
  render_modes = true,

  anti_conceal = {
    enabled = true,
    above = 0,
    below = 0,
    ignore = {
      indent = true,
      sign = true,
      virtual_lines = true,
      code_background = true,
    },
  },

  -- don't style dash
  dash = {
    enabled = false,
  },

  -- don't render links at all
  -- link = {
  --   enabled = false,
  -- },

  -- don't render markdown inside hover / floating docs / nofile buffers
  overrides = {
    buftype = {
      nofile = {
        enabled = false,
      },
    },
  },
}
