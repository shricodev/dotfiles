return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  main = 'ibl',
  opts = {
    indent = {
      char = '▏',
    },
    scope = {
      enabled = false,
      -- show_start = false,
      -- show_end = false,
    },
  },
}
