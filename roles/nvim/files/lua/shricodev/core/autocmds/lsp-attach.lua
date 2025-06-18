vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = '[LSP]: ' .. desc })
    end

    -- NOTE: Rest of the LSP bindings are done in the fzf-lua configuration.
    map('grD', vim.lsp.buf.declaration, 'Goto Declaration')
    map('<leader>d', vim.diagnostic.open_float, 'Show floating line diagnostics')

    vim.diagnostic.config {
      -- title = false,
      -- underline = true,
      -- virtual_lines = true,
      -- virtual_text = true,
      -- signs = true,
      -- update_in_insert = false,
      severity_sort = true,
      underline = { severity = vim.diagnostic.severity.ERROR },
      -- signs = {
      --   text = {
      --     [vim.diagnostic.severity.ERROR] = '󰅚 ',
      --     [vim.diagnostic.severity.WARN] = '󰀪 ',
      --     [vim.diagnostic.severity.INFO] = '󰋽 ',
      --     [vim.diagnostic.severity.HINT] = '󰌶 ',
      --   },
      -- },
      virtual_text = {
        enabled = true,
        -- source = 'if_many',
        spacing = 2,
        -- format = function(diagnostic)
        --   local diagnostic_message = {
        --     [vim.diagnostic.severity.ERROR] = diagnostic.message,
        --     [vim.diagnostic.severity.WARN] = diagnostic.message,
        --     [vim.diagnostic.severity.INFO] = diagnostic.message,
        --     [vim.diagnostic.severity.HINT] = diagnostic.message,
        --   }
        --   return diagnostic_message[diagnostic.severity]
        -- end,
      },
      float = {
        -- source = 'if_many',
        style = 'minimal',
        -- border = 'rounded',
        -- header = '',
        -- prefix = '',
      },
    }
  end,
})
