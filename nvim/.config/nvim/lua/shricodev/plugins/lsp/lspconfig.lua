return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    { 'b0o/schemastore.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },
  },
  config = function()
    local keymap = vim.keymap -- for conciseness
    require('lspconfig.ui.windows').default_options.border = 'single'

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = event.buf, silent = true }

        -- set keybinds
        opts.desc = '[LSP]: Show LSP references'
        keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts) -- show definition, references

        opts.desc = '[LSP]: Go to declaration'
        keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = '[LSP]: Show LSP definitions'
        keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts) -- show lsp definitions

        opts.desc = '[LSP]: Show LSP implementations'
        keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts) -- show lsp implementations

        opts.desc = '[LSP]: Show LSP type definitions'
        keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts) -- show lsp type definitions

        opts.desc = '[LSP]: See available code actions'
        keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = '[LSP]: Smart rename'
        keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = '[LSP]: Show buffer diagnostics'
        keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts) -- show  diagnostics for file

        opts.desc = '[LSP]: Show line diagnostics'
        keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = '[LSP]: Go to previous diagnostic'
        keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = '[LSP]: Go to next diagnostic'
        keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = '[LSP]: Document Symbols'
        vim.keymap.set('n', '<leader>ds', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)

        opts.desc = '[LSP]: Workspace Symbols'
        vim.keymap.set('n', '<leader>ws', "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", opts)

        opts.desc = '[LSP]: Show documentation for what is under cursor'
        keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = '[LSP]: Restart LSP'
        keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary

        -- Inlay hints.
        opts.desc = '[LSP]: Toggle inlay hints'
        keymap.set('n', '<leader>ht', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, opts)

        -- Thank you teej
        -- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L502
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup('nvim-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('nvim-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'nvim-lsp-highlight', buffer = event2.buf }
            end,
          })
        end
      end,
    })

    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
        }
      end,
    }

    vim.diagnostic.config {
      title = false,
      underline = true,
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        source = 'if_many',
        style = 'minimal',
        border = 'rounded',
        header = '',
        prefix = '',
      },
    }

    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end
  end,
}
