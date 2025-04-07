-- Highlight the yanked area.
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = highlight_group,
  pattern = '*',
  desc = 'Highlight selection on yank',
  callback = function()
    vim.hl.on_yank { timeout = 70 }
  end,
})
