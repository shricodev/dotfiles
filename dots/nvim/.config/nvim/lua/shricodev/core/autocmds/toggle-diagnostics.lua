-- Toggle LSP Diagnostics
vim.g.diagnostics_enabled = true

vim.api.nvim_create_user_command('ToggleDiagnostics', function()
  vim.g.diagnostics_enabled = not vim.g.diagnostics_enabled
  vim.diagnostic.enable(vim.g.diagnostics_enabled)
end, { desc = 'Toggle LSP Diagnostics' })
