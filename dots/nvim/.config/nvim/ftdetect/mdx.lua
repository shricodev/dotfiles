local group = vim.api.nvim_create_augroup('ftdetect/mdx', { clear = true })

-- This autocmd is used to set the filetype of mdx files to markdown.
-- Useful when using luasnip for snippets in mdx files.
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = group,
  pattern = '*.mdx',
  callback = function()
    vim.bo.filetype = 'markdown'
  end,
})
