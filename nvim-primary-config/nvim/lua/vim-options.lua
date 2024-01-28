vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.wo.number = true
vim.wo.relativenumber = true

-- Setup the clipboard to work globally
vim.api.nvim_exec([[
 if has('unnamedplus')
    set clipboard=unnamedplus
 else
    set clipboard=unnamed
 endif
]], false)

