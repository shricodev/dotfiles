return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufRead" },
  opts = {},
  config = function()
    require("ibl").setup({
      indent = {
        char = "▏",
        priority = 2,
      },
      whitespace = {
        remove_blankline_trail = true,
      },
      scope = {
        enabled = false,
        -- show_start = false,
        -- show_end = false,
      },
    })
  end,
}
