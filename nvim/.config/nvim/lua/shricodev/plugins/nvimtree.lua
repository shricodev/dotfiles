return {
  'nvim-tree/nvim-tree.lua',
  event = 'VeryLazy',
  config = function()
    local function my_on_attach(bufnr)
      local api = require 'nvim-tree.api'

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- use all default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- override a default. Set l to open the file in the current window
      vim.keymap.set('n', 'l', api.node.open.edit, opts 'Open')
    end

    local icons = {
      kind = {
        Array = ' ',
        Boolean = ' ',
        Class = ' ',
        Color = ' ',
        Constant = ' ',
        Constructor = ' ',
        Enum = ' ',
        EnumMember = ' ',
        Event = ' ',
        Field = ' ',
        File = ' ',
        Folder = '󰉋 ',
        Function = ' ',
        Interface = ' ',
        Key = ' ',
        Keyword = ' ',
        Method = ' ',
        -- Module = " ",
        Module = ' ',
        Namespace = ' ',
        Null = '󰟢 ',
        Number = ' ',
        Object = ' ',
        Operator = ' ',
        Package = ' ',
        Property = ' ',
        Reference = ' ',
        Snippet = ' ',
        String = ' ',
        Struct = ' ',
        Text = ' ',
        TypeParameter = ' ',
        Unit = ' ',
        Value = ' ',
        Variable = ' ',
      },
      git = {
        LineAdded = ' ',
        LineModified = ' ',
        LineRemoved = ' ',
        FileDeleted = ' ',
        FileIgnored = '◌',
        FileRenamed = ' ',
        FileStaged = 'S',
        FileUnmerged = '',
        FileUnstaged = '',
        FileUntracked = 'U',
        Diff = ' ',
        Repo = ' ',
        Octoface = ' ',
        Copilot = ' ',
        Branch = '',
      },
      ui = {
        ArrowCircleDown = '',
        ArrowCircleLeft = '',
        ArrowCircleRight = '',
        ArrowCircleUp = '',
        BoldArrowDown = '',
        BoldArrowLeft = '',
        BoldArrowRight = '',
        BoldArrowUp = '',
        BoldClose = '',
        BoldDividerLeft = '',
        BoldDividerRight = '',
        BoldLineLeft = '▎',
        BoldLineMiddle = '┃',
        BoldLineDashedMiddle = '┋',
        BookMark = '',
        BoxChecked = ' ',
        Bug = ' ',
        Stacks = '',
        Scopes = '',
        Watches = '󰂥',
        DebugConsole = ' ',
        Calendar = ' ',
        Check = '',
        ChevronRight = '',
        ChevronShortDown = '',
        ChevronShortLeft = '',
        ChevronShortRight = '',
        ChevronShortUp = '',
        Circle = ' ',
        Close = '󰅖',
        CloudDownload = ' ',
        Code = '',
        Comment = '',
        Dashboard = '',
        DividerLeft = '',
        DividerRight = '',
        DoubleChevronRight = '»',
        Ellipsis = '',
        EmptyFolder = ' ',
        EmptyFolderOpen = ' ',
        File = ' ',
        FileSymlink = '',
        Files = ' ',
        FindFile = '󰈞',
        FindText = '󰊄',
        Fire = '',
        Folder = '󰉋 ',
        FolderOpen = ' ',
        FolderSymlink = ' ',
        Forward = ' ',
        Gear = ' ',
        History = ' ',
        Lightbulb = ' ',
        LineLeft = '▏',
        LineMiddle = '│',
        List = ' ',
        Lock = ' ',
        NewFile = ' ',
        Note = ' ',
        Package = ' ',
        Pencil = '󰏫 ',
        Plus = ' ',
        Project = ' ',
        Search = ' ',
        SignIn = ' ',
        SignOut = ' ',
        Tab = '󰌒 ',
        Table = ' ',
        Target = '󰀘 ',
        Telescope = ' ',
        Text = ' ',
        Tree = '',
        Triangle = '󰐊',
        TriangleShortArrowDown = '',
        TriangleShortArrowLeft = '',
        TriangleShortArrowRight = '',
        TriangleShortArrowUp = '',
      },
      diagnostics = {
        BoldError = '',
        Error = '',
        BoldWarning = '',
        Warning = '',
        BoldInformation = '',
        Information = '',
        BoldQuestion = '',
        Question = '',
        BoldHint = '',
        Hint = '󰌶',
        Debug = '',
        Trace = '✎',
      },
      misc = {
        Robot = '󰚩 ',
        Squirrel = ' ',
        Tag = ' ',
        Watch = '',
        Smiley = ' ',
        Package = ' ',
        CircuitBoard = ' ',
      },
    }

    -- local HEIGHT_RATIO = 0.8 -- You can change this
    -- local WIDTH_RATIO = 0.5 -- You can change this too

    require('nvim-tree').setup {
      on_attach = my_on_attach,
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      view = {
        -- number = true,
        -- relativenumber = true,
        adaptive_size = false,
        width = 38,
        side = 'left',
        preserve_window_proportions = true,
        -- float = {
        --   enable = true,
        --   quit_on_focus_loss = true,
        --   -- Make the neovim window appear in the center of the screen
        --   open_win_config = function()
        --     local screen_w = vim.opt.columns:get()
        --     local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        --     local window_w = screen_w * WIDTH_RATIO
        --     local window_h = screen_h * HEIGHT_RATIO
        --     local window_w_int = math.floor(window_w)
        --     local window_h_int = math.floor(window_h)
        --     local center_x = (screen_w - window_w) / 2
        --     local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
        --     return {
        --       border = 'rounded',
        --       relative = 'editor',
        --       row = center_y,
        --       col = center_x,
        --       width = window_w_int,
        --       height = window_h_int,
        --     }
        --   end,
        -- },
        -- width = function()
        --   return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        -- end,
      },
      filesystem_watchers = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = true,
          window_picker = {
            enable = false,
          },
        },
      },
      git = {
        ignore = false,
      },
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = 'none',
        -- Enable this to view the root folder label
        root_folder_label = ':t',
        -- root_folder_label = false,
        indent_width = 2,
        indent_markers = {
          enable = true,
          inline_arrows = false,
          icons = {
            corner = '└',
            edge = '│',
            item = '│',
            none = ' ',
          },
        },
        icons = {
          git_placement = 'before',
          padding = ' ',
          symlink_arrow = ' ➛ ',
          show = {
            folder_arrow = false,
            file = true,
            folder = true,
          },
          glyphs = {
            default = icons.ui.Text,
            symlink = icons.ui.FileSymlink,
            bookmark = icons.ui.BookMark,
            folder = {
              arrow_closed = icons.ui.ChevronRight,
              arrow_open = icons.ui.ChevronShortDown,
              default = icons.ui.Folder,
              open = icons.ui.FolderOpen,
              empty = icons.ui.EmptyFolder,
              empty_open = icons.ui.EmptyFolderOpen,
              symlink = icons.ui.FolderSymlink,
              symlink_open = icons.ui.FolderOpen,
            },
            git = {
              unstaged = icons.git.FileUnstaged,
              staged = icons.git.FileStaged,
              unmerged = icons.git.FileUnmerged,
              renamed = icons.git.FileRenamed,
              untracked = icons.git.FileUntracked,
              deleted = icons.git.FileDeleted,
              ignored = icons.git.FileIgnored,
            },
          },
        },
        special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
        symlink_destination = true,
      },
      update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },
        icons = {
          hint = icons.diagnostics.BoldHint,
          info = icons.diagnostics.BoldInformation,
          warning = icons.diagnostics.BoldWarning,
          error = icons.diagnostics.BoldError,
        },
      },
    }

    -- Use <leader>b to toggle the nvim-tree
    vim.keymap.set('n', '<leader>b', ':NvimTreeToggle<CR>', { silent = true, noremap = true, desc = 'Toggle the Nvim-Tree explorer' })
    vim.keymap.set(
      'n',
      '<leader>ee',
      ':NvimTreeFindFileToggle<CR>',
      { silent = true, noremap = true, desc = 'Toggle the Nvim-Tree explorer on the current file' }
    )
    vim.keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' }) -- collapse file explorer
    vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' }) -- refresh file explorer
  end,
}
