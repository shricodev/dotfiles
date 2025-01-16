return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    -- Define linters by filetype
    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      python = { 'ruff' },
      markdown = { 'markdownlint' },
      docker = { 'hadolint' },
      go = { 'golangcilint' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    -- Function to check if buffer should be linted
    local function should_lint()
      local bufnr = vim.api.nvim_get_current_buf()
      local buffer_buftype = vim.bo[bufnr].buftype

      -- Skip linting for certain buffer types (hover docs, help, etc)
      -- buftype for any other file other than help, docs, quickfix and all are an empty string.
      if buffer_buftype ~= '' then
        return false
      end

      -- Skip if buffer name contains certain patterns typical for hover docs
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match 'hover' or bufname:match 'Preview' then
        return false
      end

      return true
    end

    -- Create autocmd with buffer type checking
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        if should_lint() then
          lint.try_lint()
        end
      end,
    })

    -- Keymap for manual linting with the same checks
    vim.keymap.set('n', '<leader>lf', function()
      if should_lint() then
        lint.try_lint()
      end
    end, { desc = '[Lint]: Trigger linting for current file' })
  end,
}
