-- Imp config file for neovim.
require 'shricodev.core'

-- Require the lazy plugin manager.
require 'shricodev.lazy'

-- Enable LSPs
vim.lsp.enable {
  'rust-analyzer',
  'luals',
  'gopls',
  'ts_ls',
  'bashls',
  'pyright',
  'jsonls',
  'dockerls',
  'yamlls',
}
