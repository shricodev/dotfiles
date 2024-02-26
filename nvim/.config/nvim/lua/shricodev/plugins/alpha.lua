return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[  ██████   █████                   █████   █████  ███                  ]],
      [[   ██████   ███                     ███     ███                        ]],
      [[   ███ ███  ███  ███████  ████████  ███     ███  ████   █████████████  ]],
      [[   ███  ███ ███  ███  ██  ███  ███  ███     ███   ███   ███  ███  ███  ]],
      [[   ███   ██████  ███████  ███  ███   ███   ███    ███   ███  ███  ███  ]],
      [[   ███    █████  ███      ███  ███    ███████     ███   ███  ███  ███  ]],
      [[  █████    █████ ███████  ████████      ███      █████ █████ ███ █████ ]],
      [[                                                                       ]],
      [[                                                     [ 😎 @shricodev ] ]],
      [[                                                                       ]],
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC b", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find String", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC sr", "󰁯  > Session Restore For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
