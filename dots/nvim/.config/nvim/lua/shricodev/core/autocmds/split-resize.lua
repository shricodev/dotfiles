-- Equalize splits on window resize
vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    vim.cmd 'tabdo wincmd ='
  end,
})
