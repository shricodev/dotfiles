return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      event = 'InsertEnter',
      version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = 'make install_jsregexp',
    },
    { 'hrsh7th/cmp-buffer', event = 'InsertEnter' },
    { 'hrsh7th/cmp-path', event = 'InsertEnter' },
    { 'saadparwaiz1/cmp_luasnip', event = 'InsertEnter' },
    { 'onsails/lspkind-nvim', event = 'InsertEnter' },
  },

  config = function()
    -- Here is where you configure the autocompletion settings.
    local lsp_zero = require 'lsp-zero'
    lsp_zero.extend_cmp()

    require('luasnip/loaders/from_vscode').lazy_load()

    -- And you can configure cmp even more, if you want to.
    local cmp = require 'cmp'
    local cmp_action = lsp_zero.cmp_action()

    cmp.setup {
      formatting = lsp_zero.cmp_format { details = true },
      mapping = cmp.mapping.preset.insert {
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-[>'] = cmp.mapping.complete(), -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(), -- close completion window
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer', keyword_length = 3 },
        { name = 'path' },
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = {
          border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        },
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
    }
  end,
}
