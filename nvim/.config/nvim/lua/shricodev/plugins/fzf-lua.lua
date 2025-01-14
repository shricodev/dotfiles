return {
  'ibhagwan/fzf-lua',
  enabled = false,
  -- optional for icon support
  dependencies = { 'echasnovski/mini.icons' },
  config = function()
    -- calling `setup` is optional for customization
    require('fzf-lua').setup {}

    vim.keymap.set('n', '<leader>/', function()
      require('fzf-lua').grep()
    end, { desc = '[FZF-Lua]: Fuzzily search in current buffer' })
  end,
}
