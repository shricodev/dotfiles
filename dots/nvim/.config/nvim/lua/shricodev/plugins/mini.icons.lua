return {
  'nvim-mini/mini.icons',
  lazy = true,
  opts = {},
  specs = {
    { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
  },
  init = function()
    -- Some  packages seem to use nvim-web-devicons to detect the use of icons.
    -- So need to mock it make them work.
    -- GitHub issue: https://github.com/echasnovski/mini.nvim/issues/1393
    -- Reddit post for this config: https://www.reddit.com/r/neovim/comments/1duf3w7/miniicons_general_icon_provider_several/
    package.preload['nvim-web-devicons'] = function()
      require('mini.icons').mock_nvim_web_devicons()
      return package.loaded['nvim-web-devicons']
    end
  end,
}
