return {
  'Exafunction/codeium.nvim',
  event = 'BufEnter',
  config = function()
    require('codeium').setup {
      virtual_text = {
        enabled = true,
        -- For some reason setting this to false causes no keybindings to work.
        map_keys = true,
        key_bindings = {
          accept = '<C-l>',
          accept_word = false,
          accept_line = false,
          next = '<M-]>',
          prev = '<M-[>',
          clear = '<M-x>',
        },
      },
    }
  end,
}
