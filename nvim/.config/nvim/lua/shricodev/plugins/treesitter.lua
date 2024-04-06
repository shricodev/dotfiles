return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'windwp/nvim-ts-autotag' },
  },
  config = function()
    -- TreeSitter plugin setup
    local treesitter = require 'nvim-treesitter.configs'
    treesitter.setup {
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },

      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = { enable = true },

      -- ensure these language parsers are installed
      ensure_installed = {
        'json',
        'javascript',
        'typescript',
        'tsx',
        'yaml',
        'html',
        'css',
        'markdown',
        'markdown_inline',
        'bash',
        'lua',
        'dockerfile',
        'gitignore',
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-Space>',
          node_incremental = '<C-Space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
    }
    -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
    require('ts_context_commentstring').setup {}
    -- EO Treesitter setup
  end,
}
