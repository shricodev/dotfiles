return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'macchiato',
      transparent_background = true,
      -- I don't like italics.
      no_italic = true,
      integrations = {
        indent_blankline = {
          enabled = false,
          scope_color = 'sapphire',
          colored_indent_levels = false,
        },
        cmp = true,
        noice = true,
        lsp_trouble = true,
        leap = false,
        alpha = true,
        fidget = true,
        gitsigns = true,
        which_key = true,
        dap = true,
        dap_ui = true,
        markdown = true,
        harpoon = true,
        illuminate = true,
        mason = true,
        native_lsp = { enabled = true },
        notify = true,
        nvimtree = true,
        symbols_outline = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
      },
    }

    -- Set the color scheme to catppuccin
    vim.cmd.colorscheme 'catppuccin'
  end,
}
