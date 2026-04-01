-- no auto continue comments on new line
-- Uses BufEnter to run after ftplugins which often re-add these flags
vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('no_auto_comment', {}),
  callback = function()
    vim.opt_local.formatoptions:remove { 'c', 'r', 'o' }
  end,
})
