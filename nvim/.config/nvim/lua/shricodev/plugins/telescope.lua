return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  tag = '0.1.8',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
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
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
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
            ['<C-p>'] = actions.move_selection_previous, -- move to prev result
            ['<C-n>'] = actions.move_selection_next, -- move to next result
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
    pcall(telescope.load_extension 'ui-select')

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
    vim.keymap.set('n', '<leader>gb', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
      })
    end, { desc = '[Telescope]: Fuzzily search in current buffer' })

    -- Search in Open Files
    vim.keymap.set('n', '<leader>gob', function()
      require('telescope.builtin').live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Buffers',
      }
    end, { silent = true, desc = '[Telescope]: Fuzzily grep in Open Files' })

    vim.keymap.set('n', '<leader>g/', function()
      require('telescope.builtin').live_grep {
        additional_args = function()
          return { '--hidden' }
        end,
      }
    end, { desc = '[Telescope]: Grep string in cwd (including hidden)' })

    vim.keymap.set('n', '<leader>gw', function()
      require('telescope.builtin').grep_string {
        additional_args = function()
          return { '--hidden' }
        end,
      }
    end, { desc = '[Telescope]: Grep string under cursor in cwd (including hidden)' })

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
    vim.keymap.set('n', '<leader>mo', '<cmd>Telescope marks<CR>', { desc = '[Telescope]: Open marks' })

    -- search for files in full vault
    vim.keymap.set(
      'n',
      '<leader>fn',
      '<cmd>Telescope find_files search_dirs={"$HOME/Documents/Obsidian-Notes/"}<CR>',
      { noremap = true, desc = '[Obsidian]: Find Obsidian Note Vault' }
    )
    vim.keymap.set(
      'n',
      '<leader>gn/',
      '<cmd>Telescope live_grep search_dirs={"$HOME/Documents/Obsidian-Notes/"}<CR>',
      { noremap = true, desc = '[Obsidian]: Grep Obsidian Vault' }
    )
  end,
}
