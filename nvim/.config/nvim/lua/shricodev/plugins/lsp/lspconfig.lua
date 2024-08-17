return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require 'lspconfig'

    -- import mason_lspconfig plugin
    local mason_lspconfig = require 'mason-lspconfig'

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

    local keymap = vim.keymap -- for conciseness
    require('lspconfig.ui.windows').default_options.border = 'single'

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

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
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    vim.diagnostic.config {
      float = {
        border = 'rounded',
      },
    }

    -- LSP settings (for overriding per client)
    local handlers = {
      ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
      ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
    }

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    mason_lspconfig.setup_handlers {
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
          handlers = handlers,
        }
      end,
      ['graphql'] = function()
        -- configure graphql language server
        lspconfig['graphql'].setup {
          capabilities = capabilities,
          handlers = handlers,
          filetypes = { 'graphql', 'gql', 'svelte', 'typescriptreact', 'javascriptreact' },
        }
      end,
      ['emmet_ls'] = function()
        -- configure emmet language server
        lspconfig['emmet_ls'].setup {
          capabilities = capabilities,
          handlers = handlers,
          filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
        }
      end,
      ['gopls'] = function()
        lspconfig['gopls'].setup {
          capabilities = capabilities,
          handlers = handlers,
          filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
            },
          },
        }
      end,
      ['lua_ls'] = function()
        -- configure lua server (with special settings)
        lspconfig['lua_ls'].setup {
          capabilities = capabilities,
          handlers = handlers,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { 'vim' },
              },
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        }
      end,
    }
  end,
}
