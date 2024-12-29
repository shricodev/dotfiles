-- return {}
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'

    telescope.setup {
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
      defaults = {
        -- winblend = 0,
        prompt_prefix = '   ',
        -- border = {},
        -- initial_mode = 'insert',
        -- selection_caret = ' ',
        -- entry_prefix = '  ',
        file_ignore_patterns = {
          'node_modules/',
          '%.git/',
          '%.next/',
          '__pycache__',
          '%.obsidian/',
          '.DS_Store',
          '%.venv/',
          '%.xlsx',
          '%.jpg',
          '%.png',
          '%.jpeg',
          '%.gif',
          '%.webp',
          '%.pdf',
          '%.odt',
          '%.ico',
        },
        -- set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        path_display = { 'smart' },
        -- selection_strategy = 'reset',
        -- layout_strategy = 'horizontal',
        -- layout_config = {
        --   horizontal = {
        --     prompt_position = 'top',
        --     preview_width = 0.55,
        --     results_width = 0.8,
        --   },
        --   vertical = {
        --     mirror = false,
        --   },
        --   width = 0.87,
        --   height = 0.80,
        --   preview_cutoff = 120,
        -- },
        mappings = {
          i = {
            ['<Esc>'] = actions.close,
            ['<C-k>'] = actions.move_selection_previous, -- move to prev result
            ['<C-j>'] = actions.move_selection_next, -- move to next result
          },
          n = { ['q'] = actions.close },
        },
      },
      pickers = {
        find_files = {
          -- theme = 'ivy',
          find_command = { 'rg', '--files', '--hidden' },
        },
        buffers = {
          sort_mru = true,
          ignore_current_buffer = false,
          mappings = {
            i = {
              ['<C-q>'] = 'delete_buffer',
            },
            n = {
              ['<C-q>'] = 'delete_buffer',
            },
          },
        },
      },
    }

    pcall(telescope.load_extension 'fzf')
    -- pcall(telescope.load_extension 'ui-select')

    -- Switch between projects
    vim.keymap.set(
      'n',
      '<C-p>',
      ":lua require('telescope').extensions.projects.projects{}<CR>",
      { noremap = true, silent = true, desc = '[Telescope]: Switch between multiple projects' }
    )

    -- Options through Telescope
    vim.keymap.set(
      'n',
      '<leader><tab>',
      "<cmd>lua require('telescope.builtin').commands()<CR>",
      { silent = true, desc = '[Telescope]: View Telescope options' }
    )

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
      })
    end, { desc = '[Telescope]: Fuzzily search in current buffer' })

    -- Search in Open Files
    vim.keymap.set('n', '<leader>so', function()
      require('telescope.builtin').live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { silent = true, desc = '[Telescope]: Fuzzily search in Open Files' })
    vim.keymap.set('n', '<leader>s/', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { desc = '[Telescope]: Find string in cwd' })
    vim.keymap.set('n', '<leader>sw', '<cmd>Telescope grep_string<CR>', { desc = '[Telescope]: Find string under cursor in cwd' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>fx', function()
      require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[Telescope]: Fuzzily find Neovim config' })

    -- Use telescope to search the help tags
    vim.keymap.set('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", { desc = '[Telescope]: Search the Help Documentation' })

    -- Setup the keybindings for the telescope plugin.
    vim.keymap.set(
      'n',
      '<leader>ff',
      "<cmd>lua require('telescope.builtin').find_files({hidden = true})<CR>",
      { desc = '[Telescope]: Fuzzy find files in the cwd' }
    )

    -- This is to also view the .env sort of files in the telescope find files ui
    vim.keymap.set(
      'n',
      '<leader>faf',
      "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<CR>",
      { desc = '[Telescope]: Fuzzy find files in the cwd' }
    )
    vim.keymap.set('n', '<leader>fr', "<cmd>lua require('telescope.builtin').oldfiles()<CR>", { desc = '[Telescope]: Fuzzy find recent files' })

    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = '[Telescope]: Open a buffer' })

    vim.keymap.set('n', '<leader>km', '<cmd>Telescope keymaps<CR>', { desc = '[Telescope]: View the keymaps' })
    vim.keymap.set('n', '<leader>mv', '<cmd>Telescope marks<CR>', { desc = '[Telescope]: View marks' })
  end,
}
