local keymap_namer = require('shricodev.utils').keymap_namer

return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  config = function()
    -- Prefer git instead of curl in order to improve connectivity in some environments
    require('nvim-treesitter.install').prefer_git = true

    -- TreeSitter plugin setup
    local treesitter = require 'nvim-treesitter.configs'

    -- Because of this issue with this harmless issue: https://github.com/nvim-lua/kickstart.nvim/issues/543
    ---@diagnostic disable-next-line: missing-fields
    treesitter.setup {
      auto_install = true,
      highlight = {
        enable = true,
        -- disable slow treesitter highlight for large files
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
      indent = { enable = true },

      -- ensure these language parsers are installed
      ensure_installed = {
        'bash',
        'css',
        'diff',
        'dockerfile',
        'git_rebase',
        'gitcommit',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        'html',
        'javascript',
        'json',
        'jsonc',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'regex',
        'sql',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
        'make',
        'proto',
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

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = { query = '@call.outer', desc = keymap_namer('textobject', 'select outer part of function call.') },
            ['if'] = { query = '@call.inner', desc = keymap_namer('textobject', 'select inner part of function call.') },
            ['am'] = { query = '@function.outer', desc = keymap_namer('textobject', 'select outer part of a method/function definition') },
            ['im'] = { query = '@function.inner', desc = keymap_namer('textobject', 'select inner part of a method/function definition') },
            ['ai'] = { query = '@conditional.outer', desc = keymap_namer('textobject', 'select outer part of a conditional') },
            ['ii'] = { query = '@conditional.inner', desc = keymap_namer('textobject', 'select inner part of a conditional') },
            -- l is for location list in recent nvim update and I don't think I use this binding much so I'm leaving it out.
            -- ['al'] = { query = '@loop.outer', desc = '[TextObject]: Select outer part of a loop' },
            -- ['il'] = { query = '@loop.inner', desc = '[TextObject]: Select inner part of a loop' },
            ['ac'] = { query = '@class.outer', desc = keymap_namer('textobject', 'select outer part of class definition.') },
            ['ic'] = { query = '@class.inner', desc = keymap_namer('textobject', 'select inner part of class definition.') },
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            -- ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            -- ['@class.outer'] = '<c-v>', -- blockwise
          },
          include_sorrounding_whitespace = true,
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = { query = '@call.outer', desc = keymap_namer('textobject', 'move to next function call start') },
            [']m'] = { query = '@function.outer', desc = keymap_namer('textobject', 'move to next method/function definition start') },
            [']c'] = { query = '@class.outer', desc = keymap_namer('textobject', 'move to next class start') },
            [']i'] = { query = '@conditional.outer', desc = keymap_namer('textobject', 'move to next condition start') },
            -- l is for location list in recent nvim update and I don't think I use this binding much so I'm leaving it out.
            -- [']l'] = { query = '@loop.outer', desc = '[textobject]: move to next loop start' },
          },
          goto_next_end = {
            [']F'] = { query = '@call.outer', desc = keymap_namer('textobject', 'move to previous function call end') },
            [']M'] = { query = '@function.outer', desc = keymap_namer('textobject', 'move to previous method/function definition end') },
            [']C'] = { query = '@class.outer', desc = keymap_namer('textobject', 'move to previous class end') },
            [']I'] = { query = '@conditional.outer', desc = keymap_namer('textobject', 'move to previous conditional end') },
            -- l is for location list in recent nvim update and I don't think I use this binding much so I'm leaving it out.
            -- [']L'] = { query = '@loop.outer', desc = '[TextObject]: Move to previous loop end' },
          },
          goto_previous_start = {
            ['[f'] = { query = '@call.outer', desc = keymap_namer('textobject', 'move to previous function call start') },
            ['[m'] = { query = '@function.outer', desc = keymap_namer('textobject', 'move to previous method/function definition start') },
            ['[c'] = { query = '@class.outer', desc = keymap_namer('textobject', 'move to previous class start') },
            ['[i'] = { query = '@conditional.outer', desc = keymap_namer('textobject', 'move to previous conditional start') },
            -- l is for location list in recent nvim update and I don't think I use this binding much so I'm leaving it out.
            -- ['[l'] = { query = '@loop.outer', desc = '[TextObject]: Move to previous loop start' },
          },
          goto_previous_end = {
            ['[F'] = { query = '@call.outer', desc = keymap_namer('textobject', 'move to previous function call end') },
            ['[M'] = { query = '@function.outer', desc = keymap_namer('textobject', 'move to previous method/function definition end') },
            ['[C'] = { query = '@class.outer', desc = keymap_namer('textobject', 'move to previous class end') },
            ['[I'] = { query = '@conditional.outer', desc = keymap_namer('textobject', 'move to previous conditional end') },
            -- l is for location list in recent nvim update and I don't think I use this binding much so I'm leaving it out.
            -- ['[L'] = { query = '@loop.outer', desc = '[TextObject]: Move to previous loop end' },
          },
        },
      },
    }
  end,
}
