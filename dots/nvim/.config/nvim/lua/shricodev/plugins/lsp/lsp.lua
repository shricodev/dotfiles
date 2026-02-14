return {
  -- This will help us setup default config for each lsp servers...
  'neovim/nvim-lspconfig', -- already loaded in mason.lua, but keep it for now. No issues.
  { 'folke/lazydev.nvim', opts = {} }, -- global vim error fix
}
