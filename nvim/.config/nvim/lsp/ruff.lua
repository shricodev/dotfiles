---@type vim.lsp.Config
return {
  cmd = { 'ruff', 'server', '--preview' },
  filetypes = {
    'pyproject',
    'python',
    'toml.pyproject',
  },
  root_markers = {
    '.ruff.toml',
    'pyproject.toml',
    'ruff.toml',
  },
  single_file_support = true,
}
