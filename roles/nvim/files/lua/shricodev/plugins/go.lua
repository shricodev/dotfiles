local keymap_namer = require('shricodev.utils').keymap_namer

return {
  'olexsmir/gopher.nvim',
  ft = 'go',
  -- branch = "develop", -- if you want develop branch
  -- keep in mind, it might break everything
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function(_, opts)
    require('gopher').setup(opts)

    vim.keymap.set('n', '<leader>goj', '<CMD>GoTagAdd json<CR>', { desc = keymap_namer('gopher', 'gotagadd json') })
    vim.keymap.set('n', '<leader>goy', '<CMD>GoTagAdd yaml<CR>', { desc = keymap_namer('gopher', 'gotagadd yaml') })
    vim.keymap.set('n', '<leader>goi', '<CMD>GoIfErr<CR>', { desc = keymap_namer('gopher', 'goiferr') })
  end,
  -- (optional) will update plugin's deps on every update
  build = function()
    vim.cmd [[silent! GoInstallDeps]]
  end,
}
