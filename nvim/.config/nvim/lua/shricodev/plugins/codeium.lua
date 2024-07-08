return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-l>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true, desc = '[Codeium]: Accept' })

    vim.keymap.set('i', '<c-j>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true, silent = true, desc = '[Codeium]: Next Suggestion' })

    vim.keymap.set('i', '<c-k>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true, silent = true, desc = '[Codeium]: Previous Suggestion' })

    vim.keymap.set('i', '<c-h>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true, desc = '[Codeium]: Clear' })
  end,
}
