local utils = require('shricodev.utils')
local keymap_namer = utils.keymap_namer
local pname = utils.plugin_name()

-- -- Codeium.nvim gives a lot of shitty errors for completion timeout.
-- return {
-- 	"Exafunction/windsurf.nvim",
-- 	enabled = false,
-- 	filetypes = {
-- 		"python",
-- 		"javascript",
-- 		"javascriptreact",
-- 		"typescript",
-- 		"typescriptreact",
-- 		"html",
-- 		"css",
-- 		"json",
-- 		"yaml",
-- 		"markdown",
-- 		"graphql",
-- 		"lua",
-- 		"bash",
-- 		"go",
-- 		"rust",
-- 	},
-- 	config = function()
-- 		require("codeium").setup({
-- 			enable_cmp_source = false,
-- 			virtual_text = {
-- 				enabled = true,
-- 				filetypes = {
-- 					python = true,
-- 					typescript = true,
-- 					javascript = true,
-- 					javascriptreact = true,
-- 					typescriptreact = true,
-- 					html = true,
-- 					css = true,
-- 					json = true,
-- 					yaml = true,
-- 					markdown = true,
-- 					graphql = true,
-- 					lua = true,
-- 					bash = true,
-- 					go = true,
-- 					rust = true,
-- 				},
-- 				idle_delay = 100,
-- 				-- Disable codeium outside the mentioned filetypes
-- 				default_filetype_enabled = false,
-- 				-- For some reason setting this to false causes no keybindings to work.
-- 				map_keys = true,
-- 				key_bindings = {
-- 					accept = "<M-;>",
-- 					accept_word = false,
-- 					accept_line = false,
-- 					next = "<M-]>",
-- 					prev = "<M-[>",
-- 					clear = "<M-x>",
-- 				},
-- 			},
-- 		})
-- 	end,
-- }

return {
  'Exafunction/codeium.vim',
  -- TODO: toggle it to true
  enabled = true,
  event = 'BufEnter',
  config = function()
    vim.keymap.set('i', '<M-;>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true, desc = keymap_namer(pname, 'accept') })

    vim.keymap.set('i', '<M-]>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true, silent = true, desc = keymap_namer(pname, 'next suggestion') })

    vim.keymap.set('i', '<M-[>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true, silent = true, desc = keymap_namer(pname, 'previous suggestion') })

    vim.keymap.set('i', '<M-x>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true, desc = keymap_namer(pname, 'clear') })
  end,
}
