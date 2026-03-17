return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    -- priority = 1000,
    opts = {},
    config = function()
      require('tokyonight').setup {
        transparent = true,
        on_colors = function(colors)
          -- Make line numbers more visible and grayish
          colors.fg_gutter = '#596084'
        end,

        on_highlights = function(hl, c)
          -- Slightly brighter, more readable comment color
          -- The default is pretty muted, so this lifts it without making it neon
          hl.Comment = { fg = '#9094c7' }
        end,
      }

      -- vim.cmd 'colorscheme tokyonight-night'
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      -- Default options:
      require('gruvbox').setup {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = '', -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {
          Pmenu = { bg = 'NONE', fg = '#ebdbb2' },
        },
        dim_inactive = false,
        transparent_mode = true,
      }

      vim.cmd 'colorscheme gruvbox'
    end,
  },
}
