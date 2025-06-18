return {
  'williamboman/mason.nvim',
  event = 'VeryLazy',
  -- We need to add mason-lspconfig as a dependency to mason
  -- as we need to make sure that mason is loaded before mason-lspconfig to make
  -- it work
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
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
          package_pending = ' ',
          package_installed = '󰄳 ',
          package_uninstalled = '󰚌 ',
        },
      },
    }

    mason_lspconfig.setup {
      -- list of servers for mason to install
      ensure_installed = {
        'ts_ls',
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
        'eslint_d', -- js linter"black"
        'gofumpt', -- go formatter
        'sqlfmt', -- sql formatter
        'goimports-reviser', -- go formatter
        -- add other formatter in the future
      },
    }
  end,
}
