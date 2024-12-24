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
          -- Sort imports
          'isort',
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },

      -- Setup the keybindings for the conform formatter
      -- vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
      --   conform.format {
      --     lsp_fallback = true,
      --     async = false,
      --     timeout_ms = 500,
      --   }
      -- end, { desc = '[Conform]: Format file or range (in visual mode)' }),
    }
  end,
}
