local keymap_namer = require('shricodev.utils').keymap_namer

return {
  -- {
  --   'MeanderingProgrammer/render-markdown.nvim',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
  --   ft = { 'markdown' },
  --   config = function()
  --     require('render-markdown').setup {
  --       heading = {
  --         sign = false,
  --       },
  --       code = {
  --         sign = false,
  --       },
  --       dash = {
  --         icon = '-',
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   'iamcco/markdown-preview.nvim',
  --   cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  --   build = 'cd app && npm install',
  --   init = function()
  --     vim.g.mkdp_filetypes = { 'markdown' }
  --   end,
  --   ft = { 'markdown' },
  --   keys = {
  --     {
  --       '<leader>mp',
  --       '<cmd>MarkdownPreviewToggle<cr>',
  --       desc =keymap_namer('markdown-preview', 'markdown preview')
  --     },
  --   },
  -- },
}
