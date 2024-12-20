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
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#5e6063', bold = true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#5e6063', bold = true })
  end,
}
