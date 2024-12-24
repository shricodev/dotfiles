-- Plugin that shows the veritcal bar or vertical column
-- It replaces my vim.opt.colorcolumn = "80" configuration

return {
  'lukas-reineke/virt-column.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    -- char = "|",
    -- char = "",
    -- char = "┇",
    -- char = "∶",
    -- char = "∷",
    -- char = "║",
    char = '⋮',
    -- char = '',
    -- char = '󰮾',
    virtcolumn = '80',
  },
}
