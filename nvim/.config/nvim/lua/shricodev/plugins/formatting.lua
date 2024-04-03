return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        css = { 'prettierd' },
        html = { 'prettierd' },
        json = { 'prettierd' },
        yaml = { 'prettierd' },
        go = { 'gofumpt', 'goimports-reviser' },
        markdown = { 'prettierd' },
        graphql = { 'prettierd' },
        lua = { 'stylua' },
        python = {
          -- To run the ruff formatter
          'ruff_format',
          -- To fix lint errors
          'ruff_fix',
          -- Sort imports
          'isort',
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
      -- -- If this is set, Conform will run the formatter asynchronously after save.
      -- -- It will pass the table to conform.format().
      -- -- This can also be a function that returns the table.
      -- format_after_save = {
      --   lsp_fallback = true,
      -- },
    }
  end,
}
