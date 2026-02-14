return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local function inactive_file_icon()
      local name = vim.fn.expand '%:t'
      if name == '' then
        return ''
      end

      local ok, devicons = pcall(require, 'nvim-web-devicons')
      if not ok then
        return ''
      end

      local ext = vim.fn.expand '%:e'
      local icon = devicons.get_icon(name, ext, { default = true }) or ''
      if icon == '' then
        return ''
      end

      return icon .. ' '
    end

    local tn = require('tokyonight.colors').setup { style = 'night' }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand '%:t') ~= 1
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand '%:p:h'
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    local function mode_color()
      local m = vim.fn.mode()
      local colors = {
        n = tn.blue,
        i = tn.green,
        v = tn.magenta,
        V = tn.magenta,
        [''] = tn.magenta, -- Visual block
        R = tn.red,
        c = tn.yellow,
        t = tn.cyan,
      }
      return colors[m] or tn.red
    end

    local theme = {
      normal = {
        a = { fg = tn.fg },
        b = { fg = tn.fg },
        c = { fg = tn.fg },
        x = { fg = tn.fg },
        y = { fg = tn.fg },
        z = { fg = tn.fg },
      },
      inactive = {
        a = { fg = tn.fg },
        b = { fg = tn.fg },
        c = { fg = tn.fg },
        x = { fg = tn.fg },
        y = { fg = tn.fg },
        z = { fg = tn.fg },
      },
    }

    local config = {
      options = {
        component_separators = '',
        section_separators = '',
        globalstatus = false,
        theme = theme,
      },

      sections = {
        -- LEFT
        lualine_a = {
          {
            function()
              return '▊'
            end,
            color = function()
              return { fg = mode_color() }
            end,
            padding = { left = 0, right = 1 },
          },
          {
            'mode',
            color = function()
              return { fg = mode_color(), gui = 'bold' }
            end,
            padding = { right = 1 },
          },
        },

        lualine_b = {},

        lualine_c = {
          {
            'filename',
            symbols = { modified = '[+]', readonly = '[-]', unnamed = '[No Name]', newfile = '[New]' },
            color = function()
              return { fg = tn.fg_highlight or tn.fg, gui = 'bold' }
            end,
          },
        },

        -- RIGHT (minimal, but diagnostics colored)
        lualine_x = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            sections = { 'error', 'warn', 'hint' },
            symbols = { error = ' ', warn = ' ', hint = ' ' },
            colored = true,
            diagnostics_color = {
              error = { fg = tn.red },
              warn = { fg = tn.yellow },
              hint = { fg = tn.blue },
            },
            update_in_insert = false,
          },
          { 'filetype', icons_enabled = true },
          { 'progress' },

          {
            'fileformat',
            icons_enabled = true,
          },

          {
            'encoding',
            fmt = string.upper,
          },

          {
            'branch',
            cond = conditions.check_git_workspace,
            icon = '',
            color = function()
              return { fg = tn.yellow, gui = 'bold' }
            end,
          },
        },

        lualine_y = {},

        lualine_z = {
          { 'location' },
          {
            function()
              return '▊'
            end,
            color = function()
              return { fg = mode_color() }
            end,
            padding = { left = 1, right = 0 },
          },
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            inactive_file_icon,
            color = function()
              return { fg = tn.comment or tn.fg }
            end,
            padding = { left = 0, right = 0 },
          },
          {
            'filename',
            color = function()
              return { fg = tn.comment or tn.fg }
            end,
            padding = { left = 0, right = 1 },
          },
        },
        lualine_x = {
          {
            'location',
            padding = { left = 1, right = 0 },
            color = function()
              return { fg = tn.comment or tn.fg }
            end,
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
    }

    require('lualine').setup(config)

    -- Transparent statusline (active + inactive), and keep it after colorscheme reloads
    local function transparent_statusline()
      vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })
    end

    transparent_statusline()

    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = transparent_statusline,
    })
  end,
}
