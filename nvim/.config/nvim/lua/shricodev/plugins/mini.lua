-- Returns all my used plugins from mini.nvim library.
return {
  {
    'echasnovski/mini.ai',
    version = false,
    config = function()
      require('mini.ai').setup {}
    end,
  },
  {
    'echasnovski/mini.surround',
    version = false,
    config = function()
      require('mini.surround').setup {}
    end,
  },
  {
    'echasnovski/mini.files',
    version = false,
    config = function()
      require('mini.files').setup {}

      vim.keymap.set('n', '<leader>e', function()
        require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
      end, { desc = '[Mini.Files]: Open mini explorer in the directory of current file' })

      vim.keymap.set('n', '<leader>E', function()
        require('mini.files').open(vim.uv.cwd(), true)
      end, { desc = '[Mini.Files]: Open mini explorer in the CWD' })
    end,
  },
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
