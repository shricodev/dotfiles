-- import mason
local mason = require 'mason'

-- import mason-lspconfig
local mason_lspconfig = require 'mason-lspconfig'

local mason_tool_installer = require 'mason-tool-installer'

-- Make sure to setup mason before mason-lspconfig
-- enable mason and configure icons
mason.setup {
  ui = {
    border = 'rounded',
    icons = {
      package_pending = ' ',
      package_installed = '󰄳 ',
      package_uninstalled = '󰚌 ',
    },
  },
}

mason_lspconfig.setup {
  -- list of servers for mason to install
  ensure_installed = {
    'ts_ls',
    'rust_analyzer',
    'bashls',
    'jsonls',
    'ruff',
    'yamlls',
    'dockerls',
    'html',
    'cssls',
    'tailwindcss',
    'gopls',
    'lua_ls',
    'emmet_ls',
    'pyright',
    'sqlls',
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
}

mason_tool_installer.setup {
  ensure_installed = {
    'prettierd', -- prettier formatter
    'prettier', -- prettier formatter (prettierd backup in formatting.lua)
    'stylua', -- lua formatter
    'isort', -- python formatter
    'eslint_d', -- js linter
    'gofumpt', -- go formatter
    'sqlfmt', -- sql formatter
    'goimports-reviser', -- go formatter
    'shfmt', -- shell formatter
    -- add other formatter/linter in the future
  },
}
