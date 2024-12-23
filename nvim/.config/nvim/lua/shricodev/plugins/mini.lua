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
}
