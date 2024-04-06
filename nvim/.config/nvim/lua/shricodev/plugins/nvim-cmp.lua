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
    { 'rafamadriz/friendly-snippets', event = 'InsertEnter' }, -- useful snippets
    { 'saadparwaiz1/cmp_luasnip', event = 'InsertEnter' },
    { 'onsails/lspkind-nvim', event = 'InsertEnter' },
  },

  config = function()
    -- Here is where you configure the autocompletion settings.
    local lsp_zero = require 'lsp-zero'
    local lspkind = require 'lspkind'

    lsp_zero.extend_cmp()

    require('luasnip/loaders/from_vscode').lazy_load()

    -- And you can configure cmp even more, if you want to.
    local cmp = require 'cmp'
    local cmp_action = lsp_zero.cmp_action()

    cmp.setup {
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },
      -- formatting = lsp_zero.cmp_format { details = true },
      mapping = cmp.mapping.preset.insert {
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
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
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format {
          maxwidth = 50,
          ellipsis_char = '...',
        },
      },
    }
  end,
}
