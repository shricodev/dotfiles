-- vim.pack plugin manager setup (Neovim 0.12+)
-- Replaces lazy.nvim with Neovim's built-in package manager.

local function gh(repo)
  return 'https://github.com/' .. repo
end

-- Build/update hooks — must be registered BEFORE vim.pack.add()
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind

    if name == 'nvim-treesitter' and kind ~= 'delete' then
      if not ev.data.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      vim.cmd 'TSUpdate'
    end

    if name == 'gopher.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then
        vim.cmd.packadd 'gopher.nvim'
      end
      vim.cmd [[silent! GoInstallDeps]]
    end
  end,
})

vim.pack.add({
  -- core dependencies
  gh 'nvim-lua/plenary.nvim',

  -- colorschemes
  gh 'folke/tokyonight.nvim',
  gh 'ellisonleao/gruvbox.nvim',

  -- icons
  gh 'nvim-mini/mini.icons',

  -- navigation
  gh 'christoomey/vim-tmux-navigator',

  -- treesitter
  { src = gh 'nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = gh 'nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },

  -- completion & snippets
  gh 'rafamadriz/friendly-snippets',
  gh 'moyiz/blink-emoji.nvim',
  { src = gh 'saghen/blink.cmp', version = vim.version.range '1.0' },
  gh 'L3MON4D3/LuaSnip',

  -- ui
  gh 'nvim-lualine/lualine.nvim',
  gh 'stevearc/oil.nvim',
  gh 'szw/vim-maximizer',

  -- git
  gh 'lewis6991/gitsigns.nvim',
  gh 'tpope/vim-fugitive',

  -- lsp & tools
  gh 'williamboman/mason.nvim',
  gh 'williamboman/mason-lspconfig.nvim',
  gh 'WhoIsSethDaniel/mason-tool-installer.nvim',
  gh 'neovim/nvim-lspconfig',

  -- editing & formatting
  gh 'nvim-mini/mini.surround',
  gh 'stevearc/conform.nvim',
  gh 'mfussenegger/nvim-lint',
  gh 'windwp/nvim-ts-autotag',

  -- fuzzy finder
  gh 'ibhagwan/fzf-lua',

  -- language specific
  gh 'olexsmir/gopher.nvim',

  -- markdown
  { src = gh 'obsidian-nvim/obsidian.nvim', version = vim.version.range '*' },
  gh 'MeanderingProgrammer/render-markdown.nvim',
}, { load = true })

-- some default nvim plugins that needs to be enabled
vim.cmd.packadd 'cfilter'
vim.cmd.packadd 'nvim.undotree'
vim.cmd.packadd 'nvim.difftool'

-- coonfigure all plugins (order matters for dependencies)
require 'shricodev.plugins.color-scheme'
require 'shricodev.plugins.mini-icons'
require 'shricodev.plugins.treesitter'
require 'shricodev.plugins.textobject'
require 'shricodev.plugins.blink-cmp'
require 'shricodev.plugins.luasnip'
require 'shricodev.plugins.lualine'
require 'shricodev.plugins.oil'
require 'shricodev.plugins.vim-maximizer'
require 'shricodev.plugins.gitsigns'
require 'shricodev.plugins.fugitive'
require 'shricodev.plugins.lsp.mason'
require 'shricodev.plugins.mini-surround'
require 'shricodev.plugins.conform'
require 'shricodev.plugins.lint'
require 'shricodev.plugins.nvim-ts-autotag'
require 'shricodev.plugins.fzf-lua'
require 'shricodev.plugins.gopher'
require 'shricodev.plugins.markdown'
