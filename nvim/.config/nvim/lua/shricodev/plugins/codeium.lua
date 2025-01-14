return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    vim.keymap.set('i', '<M-;>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true, desc = '[Codeium]: Accept' })

    vim.keymap.set('i', '<M-]>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true, silent = true, desc = '[Codeium]: Next Suggestion' })

    vim.keymap.set('i', '<M-[>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true, silent = true, desc = '[Codeium]: Previous Suggestion' })

    vim.keymap.set('i', '<M-x>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true, desc = '[Codeium]: Clear' })
  end,
}

-- Codeium.nvim gives a lot of shitty errors for completion timeout.
-- return {
--   'Exafunction/codeium.nvim',
--   event = 'BufEnter',
--   config = function()
--     require('codeium').setup {
--       enable_cmp_source = false,
--       virtual_text = {
--         enabled = true,
--         filetypes = {
--           python = true,
--           typescript = true,
--           javascript = true,
--           javascriptreact = true,
--           typescriptreact = true,
--           html = true,
--           css = true,
--           json = true,
--           yaml = true,
--           markdown = true,
--           graphql = true,
--           lua = true,
--           bash = true,
--           go = true,
--           rust = true,
--         },
--         idle_delay = 100,
--         -- Disable codeium outside the mentioned filetypes
--         default_filetype_enabled = false,
--         -- For some reason setting this to false causes no keybindings to work.
--         map_keys = true,
--         key_bindings = {
--           accept = '<Tab>',
--           accept_word = false,
--           accept_line = false,
--           next = '<M-]>',
--           prev = '<M-[>',
--           clear = '<M-x>',
--         },
--       },
--     }
--   end,
-- }
