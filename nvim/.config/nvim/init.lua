-- Import all the custom keymaps, groups and custom vim options.
-- Always load the keymappings before plugins, as they often rely on them.
require("core.options")
require("core.keymaps")

-- Load the misc settings
require("core.misc")

-- This is for the lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- EO lazy.nvim setup

require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.lsp" },
}, {
  install = {
    colorscheme = { "catppuccin", "default" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
    enabled = true,
  },
  ui = {
    border = "rounded",
  },
})
