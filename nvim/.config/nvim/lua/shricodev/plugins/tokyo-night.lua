return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require('tokyonight').setup {
      on_colors = function(colors)
        colors.border = '#2d2d2e'
      end,
    }
    vim.cmd 'colorscheme tokyonight-night'
  end,
}
