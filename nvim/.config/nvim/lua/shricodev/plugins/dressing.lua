return {
  'stevearc/dressing.nvim',
  event = 'VeryLazy',
  config = function()
    require('dressing').setup {
      -- After setting up NvimTree to float, I really don't like
      input = {
        enabled = true,

        -- Can be 'left', 'right', or 'center'
        title_pos = 'left',

        -- When true, <Esc> will close the modal
        insert_only = true,

        -- When true, input will start in insert mode.
        start_in_insert = true,

        -- These are passed to nvim_open_win
        -- anchor = "SW",
        border = 'rounded',

        buf_options = {},
        win_options = {
          -- Window transparency (0-100)
          -- winblend = 50,
          -- Disable line wrapping
          wrap = false,
          -- Indicator for when text exceeds window
          list = true,
          listchars = 'precedes:…,extends:…',
          -- Increase this for more context when text scrolls off the window
          sidescrolloff = 0,
        },
      },
      select = {
        -- Set to false to disable the vim.ui.select implementation
        enabled = true,

        -- Trim trailing `:` from prompt
        trim_prompt = true,

        -- Options for nui Menu
        -- Options for built-in selector
        builtin = {
          -- These are passed to nvim_open_win
          -- anchor = "NW",
          border = 'rounded',
          -- 'editor' and 'win' will default to being centered
          relative = 'editor',

          buf_options = {},
          win_options = {
            -- Window transparency (0-100)
            -- winblend = 50,
            cursorline = true,
            cursorlineopt = 'both',
          },

          -- Set to `false` to disable
          mappings = {
            ['<Esc>'] = 'Close',
            ['<C-c>'] = 'Close',
            ['<CR>'] = 'Confirm',
          },
        },
      },
    }
  end,
}
