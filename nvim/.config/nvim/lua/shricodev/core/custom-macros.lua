-- NOTE: All the macros are created using the esc command as 'jk', so be sure to
-- have it as your escape key.
-- I got this custom macro tip from this yt video: https://www.youtube.com/watch?v=Y3XWijJgdJs
-- Feel free to refer to this. if you are copying or using my config.

vim.api.nvim_create_augroup('JSLogMacro', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = 'JSLogMacro',
  pattern = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact' },
  callback = function()
    vim.fn.setreg('l', "yoconsole.log()jki''jkPa:jkla, jkplojk")
  end,
})
