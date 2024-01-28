
  return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      -- TreeSitter plugin setup
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {"lua", "javascript", "go"},
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
      -- EO Treesitter setup
    end
  }
