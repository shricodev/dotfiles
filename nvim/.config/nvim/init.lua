-- Imp config file for neovim.
require 'shricodev.core'

-- Require the lazy plugin manager.
require 'shricodev.lazy'

-- Setup LSPs
vim.lsp.enable { 'ruff', 'rust-analyzer', 'luals' }
