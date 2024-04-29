return {
  'nvim-telescope/telescope-ui-select.nvim',
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', lazy = true },
      { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
      local telescope = require 'telescope'
      local actions = require 'telescope.actions'
      telescope.setup {
        defaults = {
          winblend = 0,
          prompt_prefix = '   ',
          border = {},
          initial_mode = 'insert',
          selection_caret = '⮞ ',
          entry_prefix = '  ',
          file_ignore_patterns = { 'node_modules', '.git' },
          set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
          borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
          color_devicons = true,
          path_display = { 'smart' },
          selection_strategy = 'reset',
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = {
            i = {
              ['<Esc>'] = actions.close,
              ['<C-k>'] = actions.move_selection_previous, -- move to prev result
              ['<C-j>'] = actions.move_selection_next, -- move to next result
              ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            },
            n = { ['q'] = actions.close },
          },
          extensions = {
            ['ui-select'] = {
              require('telescope.themes').get_dropdown {},
            },
          },
        },
      }

      telescope.load_extension 'fzf'
      telescope.load_extension 'harpoon'
      telescope.load_extension 'ui-select'

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
      vim.keymap.set('n', '<leader>s/', function()
        require('telescope.builtin').live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { silent = true, desc = '[Telescope]: Fuzzily search in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[Telescope]: Fuzzily find Neovim config' })

      -- Use telescope to search the help tags
      vim.keymap.set('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", { desc = '[Telescope]: Search the Help Documentation' })

      -- Setup the keybindings for the telescope plugin.
      vim.keymap.set('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", { desc = '[Telescope]: Fuzzy find files in the cwd' })
      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        require('telescope.builtin').live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[Telescope]: Fizzy find in Open Files' })

      -- This is to also view the .env sort of files in the telescope find files ui
      vim.keymap.set(
        'n',
        '<leader>faf',
        "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<CR>",
        { desc = '[Telescope]: Fuzzy find files in the cwd' }
      )
      vim.keymap.set('n', '<leader>fs', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { desc = '[Telescope]: Find string in cwd' })
      vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = '[Telescope]: Fuzzy find recent files' })
      vim.keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = '[Telescope]: Find string under cursor in cwd' })

      vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = '[Telescope]: Open a buffer' })

      vim.keymap.set('n', '<leader>km', '<cmd>Telescope keymaps<CR>', { desc = '[Telescope]: View the keybindings' })
      vim.keymap.set('n', '<leader>mv', '<cmd>Telescope marks<CR>', { desc = '[Telescope]: View  marks' })

      vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<CR>', { desc = '[Telescope]: Git Branches' })
    end,
  },
}
