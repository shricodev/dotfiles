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
      signs = true,
      update_in_insert = false,
      severity_sort = true,
      underline = { severity = vim.diagnostic.severity.ERROR },
      virtual_text = {
        enabled = true,
        prefix = '●',
        -- source = 'if_many',
        spacing = 2,
      },
    }

    vim.diagnostic.config {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '✗',
          [vim.diagnostic.severity.WARN] = '⚠',
          [vim.diagnostic.severity.INFO] = 'ℹ',
          [vim.diagnostic.severity.HINT] = '💡',
        },
      },
    }
  end,
})
