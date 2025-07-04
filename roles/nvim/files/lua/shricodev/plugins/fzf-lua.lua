local keymap_namer = require('shricodev.utils').keymap_namer

return {
  'ibhagwan/fzf-lua',
  enabled = true,
  -- optional for icon support
  dependencies = { 'echasnovski/mini.icons' },
  keys = {
    {
      '<leader>gb',
      function()
        require('fzf-lua').lgrep_curbuf()
      end,
      desc = keymap_namer('fzf-lua', 'fuzzily search in current buffer'),
    },
    {
      '<leader>gW',
      function()
        require('fzf-lua').grep_cWORD { hidden = true }
      end,
      desc = keymap_namer('fzf-lua', 'fuzzily search current WORD'),
    },
    {
      '<leader>gw',
      function()
        require('fzf-lua').grep_cword { hidden = true }
      end,
      desc = keymap_namer('fzf-lua', 'fuzzily search current word'),
    },
    {
      '<leader>g/',
      function()
        require('fzf-lua').live_grep_native { hidden = true }
      end,
      desc = keymap_namer('fzf-lua', 'fuzzily search string in cwd (including hidden)'),
    },
    {
      '<leader>fx',
      function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = keymap_namer('fzf-lua', 'fuzzily find neovim config'),
    },
    {
      '<leader>faf',
      function()
        require('fzf-lua').files { hidden = true, no_ignore = true }
      end,
      desc = keymap_namer('fzf-lua', 'fuzzily find files in the cwd (including hidden)'),
    },
    {
      '<leader>ff',
      function()
        require('fzf-lua').files { hidden = true }
      end,
      desc = keymap_namer('fzf-lua', 'fuzzily find files in the cwd'),
    },
    {
      '<leader>fb',
      function()
        require('fzf-lua').buffers()
      end,
      desc = keymap_namer('fzf-lua', 'fuzzily find buffers'),
    },
    {
      '<leader>fr',
      function()
        require('fzf-lua').oldfiles()
      end,
      desc = keymap_namer('fzf-lua', 'fuzzily find recent files'),
    },
    -- I already have fr for oldfiles, so I am using fzr for this kind of like
    -- [fz]f [r]esume
    {
      '<leader>fzr',
      function()
        require('fzf-lua').resume()
      end,
      desc = keymap_namer('fzf-lua', 'resume last fzf-lua search'),
    },
    {
      '<leader>fh',
      function()
        require('fzf-lua').help_tags()
      end,
      desc = keymap_namer('fzf-lua', 'fuzzily find help tags'),
    },
    {
      '<leader>fk',
      function()
        require('fzf-lua').keymaps {
          profile = 'ivy',
          -- show_details = false,
          winopts = {
            preview = { hidden = true },
          },
        }
      end,
      desc = keymap_namer('fzf-lua', 'fuzzily find keymaps'),
    },
    {
      '<leader>fm',
      function()
        require('fzf-lua').marks()
      end,
      desc = keymap_namer('fzf-lua', 'fuzzily find marks'),
    },
    {
      '<leader>xw',
      function()
        require('fzf-lua').diagnostics_workspace()
      end,
      desc = keymap_namer('fzf-lua', 'view the workspace diagnostics'),
    },
    {
      '<leader>xd',
      function()
        require('fzf-lua').diagnostics_document()
      end,
      desc = keymap_namer('fzf-lua', 'view the document diagnostics'),
    },
    -- making it gW to match gO for document symbols
    {
      'gW',
      function()
        require('fzf-lua').lsp_live_workspace_symbols()
      end,
      desc = keymap_namer('fzf-lua', 'view the workspace symbols'),
    },
    -- gO is by default, I want to use fzf-lua version one
    {
      'gO',
      function()
        require('fzf-lua').lsp_document_symbols()
      end,
      desc = keymap_namer('fzf-lua', 'view the document symbols'),
    },
    -- gra is by default for code actions. Overriding it to use fzf-lua
    {
      'gra',
      function()
        require('fzf-lua').lsp_code_actions {
          winopts = {
            preview = { hidden = true },
            relative = 'cursor',
            row = 1.01,
            col = 0,
            width = 0.4,
            height = 0.2,
          },
        }
      end,
      desc = keymap_namer('fzf-lua', 'view the code actions'),
    },
    {
      'grt',
      function()
        require('fzf-lua').lsp_typedefs()
      end,
      desc = keymap_namer('fzf-lua', 'view the typedefs'),
    },
    {
      'grd',
      function()
        require('fzf-lua').lsp_definitions()
      end,
      desc = keymap_namer('fzf-lua', 'view the definitions'),
    },
    {
      -- This is the default nvim binding, which I am overriding here.
      'z=',
      function()
        require('fzf-lua').spell_suggest {
          winopts = {
            relative = 'cursor',
            row = 1.01,
            col = 0,
            width = 0.2,
            height = 0.2,
          },
        }
      end,
      desc = keymap_namer('fzf-lua', 'spell suggestions'),
    },
    {
      '<leader>fn',
      function()
        require('fzf-lua').files { cwd = '$HOME/Documents/Obsidian-Notes/' }
      end,
      desc = keymap_namer('fzf-lua', 'fuzzily find notes'),
    },
    {
      '<leader>gn/',
      function()
        require('fzf-lua').live_grep_native { cwd = '$HOME/Documents/Obsidian-Notes/' }
      end,
      desc = keymap_namer('fzf-lua', 'fuzzily search notes'),
    },
    {
      '<leader><tab>',
      function()
        require('fzf-lua').builtin()
      end,
      desc = keymap_namer('fzf-lua', 'view the fzf-lua options'),
    },
    {
      '<leader>fp',
      function()
        require('fzf-lua').zoxide()
      end,
      desc = keymap_namer('fzf-lua', 'switch between multiple recent directories (not necessarily a project)'),
    },
  },
  opts = {
    oldfiles = {
      include_current_session = true,
    },
    previewers = {
      builtin = {
        -- fzf-lua is very fast, but it really struggled to preview a couple files
        -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
        -- It turns out it was Treesitter having trouble parsing the files.
        -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
        -- (Yes, I know you shouldn't have 100KB minified files in source control.)
        syntax_limit_b = 1024 * 100, -- 100KB
      },
    },
    winopts = {
      -- using bat_native or bat improves the performance.
      -- according to fzf-lua docs. see: https://github.com/ibhagwan/fzf-lua/wiki#how-do-i-get-maximum-performance-out-of-fzf-lua
      preview = { border = 'none' },
    },
    fzf_opts = { ['--cycle'] = true },
    files = {
      -- fzf_opts = { ['--nth'] = false },
      file_icons = true,
      color_icons = true,
      -- I have modified the default settings to also exclude node_modules and .next directory
      find_opts = [[-type f \! -path '*/.git/*' \! -path '*/node_modules/*' \! -path '*/.next/*']],
      rg_opts = [[--color=never --hidden --files -g "!.git" -g "!node_modules" -g "!.next"]],
      fd_opts = [[--color=never --hidden --type f --exclude .git --exclude node_modules --exclude .next]],
    },
    keymap = {
      fzf = {
        -- mimic the telescope behavior
        ['ctrl-q'] = 'select-all+accept',
        ['ctrl-d'] = 'preview-page-down',
        ['ctrl-u'] = 'preview-page-up',
        ['f4'] = 'toggle-preview',
        ['f3'] = 'toggle-preview-wrap',
      },
    },
  },
  -- },
}
