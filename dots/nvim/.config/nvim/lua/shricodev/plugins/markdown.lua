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
  render_modes = true, -- keep rendering een in insert mode

  anti_conceal = {
    enabled = true,
    above = 0,
    below = 0,
    ignore = {
      -- add more if required
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

  -- don't style headings
  -- heading = {
  --   enabled = false,
  -- },

  -- win_options = {
  --   concealcursor = {
  --     default = vim.o.concealcursor,
  --     rendered = 'nc',
  --   },
  -- },
}
