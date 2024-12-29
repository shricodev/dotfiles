-- Returns all my used plugins from mini.nvim library.
return {
  -- {
  --   'echasnovski/mini.ai',
  --   version = false,
  --   config = function()
  --     require('mini.ai').setup {}
  --   end,
  -- },
  {
    'echasnovski/mini.surround',
    version = false,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('mini.surround').setup {
        highlight_duration = 100,

        mappings = {
          add = 'ys',
          delete = 'ds',
          find = '',
          find_left = '',
          highlight = '',
          replace = 'cs',
          update_n_lines = '',

          -- Add this only if you don't want to use extended mappings
          suffix_last = '',
          suffix_next = '',
        },
        search_method = 'cover_or_next',
      }

      -- Remap adding surrounding to Visual mode selection
      vim.keymap.del('x', 'ys')
      vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

      -- Make special mapping for "add surrounding for line"
      vim.keymap.set('n', 'yss', 'ys_', { remap = true })
    end,
  },
  {
    'echasnovski/mini.icons',
    lazy = true,
    opts = {},
    specs = {
      { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
    },
    init = function()
      -- Some  packages seem to use nvim-web-devicons to detect the use of icons.
      -- So need to mock it make them work.
      -- GitHub issue: https://github.com/echasnovski/mini.nvim/issues/1393
      -- Reddit post for this config: https://www.reddit.com/r/neovim/comments/1duf3w7/miniicons_general_icon_provider_several/
      package.preload['nvim-web-devicons'] = function()
        require('mini.icons').mock_nvim_web_devicons()
        return package.loaded['nvim-web-devicons']
      end
    end,
  },
  -- {
  --   'echasnovski/mini.files',
  --   version = false,
  --   config = function()
  --     require('mini.files').setup {}
  --
  --     vim.keymap.set('n', '<leader>e', function()
  --       require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
  --     end, { desc = '[Mini.Files]: Open mini explorer in the directory of current file' })
  --
  --     vim.keymap.set('n', '<leader>E', function()
  --       require('mini.files').open(vim.uv.cwd(), true)
  --     end, { desc = '[Mini.Files]: Open mini explorer in the CWD' })
  --   end,
  -- },
  -- {
  --   'echasnovski/mini.indentscope',
  --   version = false, -- wait till new 0.7.0 release to put it back on semver
  --   opts = {
  --     symbol = '│',
  --     options = { try_as_border = true },
  --   },
  --   init = function()
  --     vim.api.nvim_create_autocmd('FileType', {
  --       pattern = {
  --         'help',
  --         'alpha',
  --         'dashboard',
  --         'neo-tree',
  --         'Trouble',
  --         'trouble',
  --         'lazy',
  --         'mason',
  --         'notify',
  --         'toggleterm',
  --         'lazyterm',
  --       },
  --       callback = function()
  --         vim.b.miniindentscope_disable = true
  --       end,
  --     })
  --   end,
  -- },
}