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
      desc = '[FZF-Lua]: Fuzzily search in current buffer',
    },
    {
      '<leader>gW',
      function()
        require('fzf-lua').grep_cWORD { hidden = true }
      end,
      desc = '[FZF-Lua]: Fuzzily search in current WORD',
    },
    {
      '<leader>gw',
      function()
        require('fzf-lua').grep_cword { hidden = true }
      end,
      desc = '[FZF-Lua]: Fuzzily search in current word',
    },
    {
      '<leader>g/',
      function()
        require('fzf-lua').live_grep_native { hidden = true }
      end,
      desc = '[FZF-Lua]: Fuzzily search in current project',
    },
    {
      '<leader>fx',
      function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[FZF-Lua]: Fuzzily find Neovim config',
    },
    {
      '<leader>faf',
      function()
        require('fzf-lua').files { hidden = true, no_ignore = true }
      end,
      desc = '[FZF-Lua]: Fuzzily find all files',
    },
    {
      '<leader>ff',
      function()
        require('fzf-lua').files { hidden = true }
      end,
      desc = '[FZF-Lua]: Fuzzily find files',
    },
    {
      '<leader>fb',
      function()
        require('fzf-lua').buffers()
      end,
      desc = '[FZF-Lua]: Find open buffers',
    },
    {
      '<leader>fr',
      function()
        require('fzf-lua').oldfiles()
      end,
      desc = '[FZF-Lua]: Fuzzily find recent files',
    },
    -- I already have fr for oldfiles, so I am using fzr for this kind of like
    -- [fz]f [r]esume
    {
      '<leader>fzr',
      function()
        require('fzf-lua').resume()
      end,
      desc = '[FZF-Lua]: Fzf resume previous search',
    },
    {
      '<leader>fh',
      function()
        require('fzf-lua').help_tags()
      end,
      desc = '[FZF-Lua]: Find help documentation',
    },
    {
      '<leader>fk',
      function()
        require('fzf-lua').keymaps {
          -- show_details = false,
          winopts = {
            preview = { hidden = true },
          },
        }
      end,
      desc = '[FZF-Lua]: Find keymaps',
    },
    {
      '<leader>fm',
      function()
        require('fzf-lua').marks()
      end,
      desc = '[FZF-Lua]: Find marks',
    },
    {
      '<leader>xw',
      function()
        require('fzf-lua').diagnostics_workspace()
      end,
      desc = '[FZF-Lua]: View the project diagnostics',
    },
    {
      '<leader>xd',
      function()
        require('fzf-lua').diagnostics_document()
      end,
      desc = '[FZF-Lua]: View the document diagnostics',
    },
    -- making it g0 to match gO for document symbols
    {
      'g0',
      function()
        require('fzf-lua').lsp_live_workspace_symbols()
      end,
      desc = '[FZF-Lua]: View the workspace symbols',
    },
    -- gO is by default, I want to use fzf-lua version one
    {
      'gO',
      function()
        require('fzf-lua').lsp_document_symbols()
      end,
      desc = '[FZF-Lua]: View the document symbols',
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
      desc = '[FZF-Lua]: Spelling suggestions (Overriden default z=)',
    },
    {
      '<leader>fn',
      function()
        require('fzf-lua').files { cwd = '$HOME/Documents/Obsidian-Notes/' }
      end,
      desc = '[FZF-Lua]: Find obsidian notes',
    },
    {
      '<leader>gn/',
      function()
        require('fzf-lua').live_grep_native { cwd = '$HOME/Documents/Obsidian-Notes/' }
      end,
      desc = '[FZF-Lua]: Grep obsidian notes',
    },
    {
      '<leader><tab>',
      function()
        require('fzf-lua').builtin()
      end,
      desc = '[FZF-Lua]: View FZF-lua options',
    },
    {
      '<leader>fp',
      function()
        require('fzf-lua').zoxide()
      end,
      desc = '[FZF-Lua]: Switch between multiple recent directories (not necessarily a project)',
    },
  },
  opts = {
    winopts = {
      -- using bat_native or bat improves the performance.
      -- according to fzf-lua docs. see: https://github.com/ibhagwan/fzf-lua/wiki#how-do-i-get-maximum-performance-out-of-fzf-lua
      preview = { default = 'bat_native' },
    },
    fzf_opts = { ['--cycle'] = true },
    files = {
      -- I have modified the default settings to also exclude node_modules and .next directory
      find_opts = [[-type f \! -path '*/.git/*' \! -path '*/node_modules/*' \! -path '*/.next/*']],
      rg_opts = [[--color=never --hidden --files -g "!.git" -g "!node_modules" -g "!.next"]],
      fd_opts = [[--color=never --hidden --type f --type l --exclude .git --exclude node_modules --exclude .next]],
    },
    keymap = {
      builtin = {
        -- set to true to get all the default bindings shown here:
        -- https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#customization
        true,
      },
    },
  },
  -- config = function()
  --   -- calling `setup` is optional for customization
  --   require('fzf-lua').setup {}
  --
  --   vim.keymap.set('n', '<leader>/', function()
  --     require('fzf-lua').grep()
  --   end, { desc = '[FZF-Lua]: Fuzzily search in current buffer' })
  -- end,
}
