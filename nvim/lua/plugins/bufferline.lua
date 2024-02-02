return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      color_icons = true,
      show_buffer_icons = true,
      -- offsets = {
      --   filetype = "NeoTree", -- does not work with neo-tree till today. May work in future.
      --   text_align = "center",
      -- },
      diagnostics = "nvim_lsp",
      diagnostics_indicator = true,
      separator_style = { "", "" },
    },
  },
}
