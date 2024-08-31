return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    { 'windwp/nvim-ts-autotag' },
  },
  config = function()
    -- Prefer git instead of curl in order to improve connectivity in some environments
    require('nvim-treesitter.install').prefer_git = true

    -- TreeSitter plugin setup
    local treesitter = require 'nvim-treesitter.configs'

    -- Because of this issue with this harmless issue: https://github.com/nvim-lua/kickstart.nvim/issues/543
    ---@diagnostic disable-next-line: missing-fields
    treesitter.setup {
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },

      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = { enable = true },

      -- ensure these language parsers are installed
      ensure_installed = {
        'json',
        'jsonc',
        'javascript',
        'typescript',
        'bash',
        'go',
        'gomod',
        'gosum',
        'diff',
        'tsx',
        'regex',
        'yaml',
        'html',
        'css',
        'markdown',
        'vim',
        'vimdoc',
        'sql',
        'markdown_inline',
        'bash',
        'lua',
        'luadoc',
        'dockerfile',
        'gitignore',
        'git_rebase',
        'gitcommit',
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
  end,
}
