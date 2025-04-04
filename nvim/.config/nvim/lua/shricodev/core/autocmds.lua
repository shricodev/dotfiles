-- LSP bindings and config
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

-- This autocmd is used to set the filetype of mdx files to markdown.
-- Useful when using luasnip for snippets in mdx files.
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.mdx',
  callback = function()
    vim.bo.filetype = 'markdown'
  end,
})

-- wrap and check for spell in text filetypes
-- Use spelling for markdown files ‘]s’ to find next, ‘[s’ for previous,
-- 'z=‘ for suggestions when on one.
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('wrap_spell', { clear = true }),
  pattern = { 'text', 'plaintext', 'gitcommit', 'markdown', 'mdx' },
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
end, { desc = 'Toggle LSP Diagnostics' })

-- Always open terminal in insert mode.
vim.api.nvim_create_autocmd({ 'TermOpen', 'BufEnter' }, {
  pattern = { '*' },
  callback = function()
    if vim.opt.buftype:get() == 'terminal' then
      vim.cmd ':startinsert'
    end
  end,
})

-- show cursor line only in active window
local cursorGrp = vim.api.nvim_create_augroup('CursorLine', { clear = true })
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
  pattern = '*',
  command = 'set cursorline',
  group = cursorGrp,
})
vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, { pattern = '*', command = 'set nocursorline', group = cursorGrp })

-- -- Open the help window to the right
-- vim.api.nvim_create_autocmd('FileType', {
--   group = vim.api.nvim_create_augroup('vertical_help', { clear = true }),
--   pattern = 'help',
--   callback = function()
--     vim.bo.bufhidden = 'unload'
--     vim.cmd.wincmd 'L'
--     vim.cmd.wincmd '='
--   end,
-- })
