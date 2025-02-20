return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' }, -- to disable, comment this out
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        yaml = { 'prettierd', 'prettier', stop_after_first = true },
        go = { 'gofumpt', 'goimports-reviser' },
        sql = { 'sqlfmt' },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
        graphql = { 'prettierd', 'prettier', stop_after_first = true },
        lua = { 'stylua' },
        proto = { 'buf' },
        python = {
          -- To run the ruff formatter
          'ruff_format',
          -- Sort imports
          'isort',
        },
      },
      notify_on_error = false,
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
