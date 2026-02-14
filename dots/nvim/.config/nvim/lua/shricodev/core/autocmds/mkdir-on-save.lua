-- Create parent directories on save if not exists
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    local dir = vim.fn.expand '<afile>:p:h'
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})
