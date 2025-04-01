vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = '[LSP]: ' .. desc })
    end

    map('grD', vim.lsp.buf.declaration, 'Goto Declaration')
    map('<leader>d', vim.diagnostic.open_float, 'Show floating line diagnostics')
    -- NOTE: Rest of the LSP bindings are done in the fzf-lua configuration.
  end,
})
