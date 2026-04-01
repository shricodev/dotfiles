require('blink.cmp').setup {
  -- 'default' for mappings similar to built-in completion
  -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
  -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
  -- See the full "keymap" documentation for information on defining your own keymap.
  keymap = {
    preset = 'none',
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-p>'] = { 'select_prev', 'fallback' },
    ['<C-n>'] = { 'select_next', 'fallback' },
    ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
    ['<C-e>'] = { 'hide' },
    ['<C-y>'] = { 'select_and_accept' },
  },

  -- don't show blink in cmdline
  -- cmdline = {
  --   enabled = false,
  -- },
  completion = {
    -- menu = { border = 'single' },
    documentation = { auto_show = true, auto_show_delay_ms = 400 },
  },
  -- use ctrl-s in insert mode instead.
  signature = { enabled = true },

  appearance = {
    nerd_font_variant = 'mono',
  },

  snippets = {
    preset = 'luasnip',
  },
  -- Default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji' },
    providers = {
      -- trigger character by default is :
      emoji = {
        module = 'blink-emoji',
        name = 'Emoji',
        score_offset = 15, -- Tune by preference
        opts = { insert = true }, -- Insert emoji (default) or complete its name
      },
    },
  },

  fuzzy = { implementation = 'prefer_rust_with_warning' },
}
