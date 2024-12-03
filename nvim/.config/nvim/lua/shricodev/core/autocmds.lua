-- Highlight the yanked area.
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = highlight_group,
  pattern = '*',
  desc = 'Highlight selection on yank',
  callback = function()
    vim.highlight.on_yank { timeout = 100 }
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('wrap_spell', { clear = true }),
  pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ 'FileType' }, {
  group = vim.api.nvim_create_augroup('json_conceal', { clear = true }),
  pattern = { 'json', 'jsonc', 'json5' },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- Open the help window to the right
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('vertical_help', { clear = true }),
  pattern = 'help',
  callback = function()
    vim.bo.bufhidden = 'unload'
    vim.cmd.wincmd 'L'
    vim.cmd.wincmd '='
  end,
})

-- Toggle LSP Diagnostics
vim.api.nvim_create_user_command('ToggleDiagnostics', function()
  if vim.g.diagnostics_enabled == nil then
    vim.g.diagnostics_enabled = false
    vim.diagnostic.enable(false)
  elseif vim.g.diagnostics_enabled then
    vim.g.diagnostics_enabled = false
    vim.diagnostic.enable(false)
  else
    vim.g.diagnostics_enabled = true
    vim.diagnostic.enable()
  end
end, {})

-- Always open terminal in insert mode.
vim.api.nvim_create_autocmd({ 'TermOpen', 'BufEnter' }, {
  pattern = { '*' },
  callback = function()
    if vim.opt.buftype:get() == 'terminal' then
      vim.cmd ':startinsert'
    end
  end,
})
