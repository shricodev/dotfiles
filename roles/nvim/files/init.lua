-- Imp config file for neovim.
require 'shricodev.core'

-- Require the lazy plugin manager.
require 'shricodev.lazy'

--  This function basically helps get rid of having to type vim.lsp.enable()
--  for each individual lsp servers. It will simply iterate on the /lsp
--  directory and enable based on the name of the file there.
local function setup_lsp()
  local lsp_dir = vim.fn.stdpath 'config' .. '/lsp'
  local lsp_servers = {}

  if vim.fn.isdirectory(lsp_dir) == 1 then
    for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
      if file:match '%.lua$' and file ~= 'init.lua' then
        local server_name = file:gsub('%.lua$', '')
        table.insert(lsp_servers, server_name)
      end
    end
  end

  vim.lsp.enable(lsp_servers)
end

setup_lsp()
