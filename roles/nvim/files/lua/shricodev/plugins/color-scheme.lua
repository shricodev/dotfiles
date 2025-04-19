return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "main", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},
				palette = {},
				before_highlight = function() end,

				highlight_groups = {
					-- Change the vertical line color
					ColorColumn = { bg = "#232334" },
				},
			})

			vim.cmd("colorscheme rose-pine-moon")
		end,
	},
	--   {
	--     'folke/tokyonight.nvim',
	--     lazy = true,
	--     -- priority = 1000,
	--     opts = {},
	--     -- config = function()
	--     --   require('tokyonight').setup {
	--     --     -- on_colors = function(colors)
	--     --     --   colors.border = '#2d2d2e'
	--     --     -- end,
	--     --   }
	--     --   -- vim.cmd 'colorscheme tokyonight-night'
	--     --   -- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#5e6063', bold = true })
	--     --   -- vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
	--     --   -- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#5e6063', bold = true })
	--     -- end,
	--   },
}
