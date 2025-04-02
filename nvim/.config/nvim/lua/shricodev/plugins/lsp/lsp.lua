return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    {
      'folke/lazydev.nvim',
      ft = 'lua', -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
  },
  config = function()
    require('lspconfig.ui.windows').default_options.border = 'single'

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = '[LSP]: ' .. desc })
        end

        -- set keybinds
        map('gr', require('telescope.builtin').lsp_references, 'Goto References')

        map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

        map('gd', require('telescope.builtin').lsp_definitions, 'Goto Definition')

        map('gI', require('telescope.builtin').lsp_implementations, 'Goto Implementation')

        map('gT', require('telescope.builtin').lsp_type_definitions, 'Show LSP type definitions')

        map('<leader>ca', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })

        map('<leader>rn', vim.lsp.buf.rename, 'Smart Rename')

        map('<leader>d', vim.diagnostic.open_float, 'Show line diagnostics')

        map('[d', vim.diagnostic.goto_prev, 'Goto previous diagnostic')

        map(']d', vim.diagnostic.goto_next, 'Goto next diagnostic')

        map('<leader>sd', function()
          require('telescope.builtin').lsp_document_symbols()
        end, 'Document Symbols')

        map('<leader>sw', function()
          require('telescope.builtin').lsp_dynamic_workspace_symbols()
        end, 'Workspace Symbols')

        map('K', vim.lsp.buf.hover, 'Show documentation for what is under cursor')

        -- Thank you teej
        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        -- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L502
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        -- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
        --   local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
        --   vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        --     buffer = event.buf,
        --     group = highlight_augroup,
        --     callback = vim.lsp.buf.document_highlight,
        --   })
        --
        --   vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        --     buffer = event.buf,
        --     group = highlight_augroup,
        --     callback = vim.lsp.buf.clear_references,
        --   })
        --
        --   vim.api.nvim_create_autocmd('LspDetach', {
        --     group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        --     callback = function(event2)
        --       vim.lsp.buf.clear_references()
        --       vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        --     end,
        --   })
        -- end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map('<leader>ht', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, 'Toggle inlay hints')
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities.textDocument.completion.completionItem.snippetSupport = true
    -- capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

    local servers = {
      -- clangd = {},
      gopls = {
        cmd = { 'gopls' },
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
        settings = {
          gopls = {
            completeUnimported = true,
            -- usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      },
      -- pyright = {},
      -- rust_analyzer = {},
      -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
      --
      -- Some languages (like typescript) have entire language plugins that can be useful:
      --    https://github.com/pmizio/typescript-tools.nvim
      --
      -- But for many setups, the LSP (`ts_ls`) will work just fine
      ts_ls = {},
      --

      graphql = {},
      -- emmet_ls = {
      --   filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      -- },
      lua_ls = {
        -- cmd = { ... },
        -- filetypes = { ... },
        -- capabilities = {},
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }

    local mason_lspconfig = require 'mason-lspconfig'

    local handlers = {
      ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
      ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
    }

    mason_lspconfig.setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for ts_ls)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          server.handlers = handlers
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    vim.diagnostic.config {
      -- title = false,
      -- underline = true,
      -- virtual_lines = true,
      -- virtual_text = true,
      -- signs = true,
      -- update_in_insert = false,
      -- severity_sort = true,
      float = {
        -- source = 'if_many',
        style = 'minimal',
        border = 'rounded',
        -- header = '',
        -- prefix = '',
      },
    }

    -- local signs = { Error = '!!', Warn = '??', Hint = '**', Info = '@@' }
    -- for type, icon in pairs(signs) do
    --   local hl = 'DiagnosticSign' .. type
    --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    -- end
  end,
}
