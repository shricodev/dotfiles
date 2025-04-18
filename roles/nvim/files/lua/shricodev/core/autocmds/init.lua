-- load all the autocmds in this directory
local autocmd_files = vim.fn.glob(vim.fn.stdpath 'config' .. '/lua/shricodev/core/autocmds/*.lua')

for _, file in ipairs(vim.split(autocmd_files, '\n')) do
  -- Skip loading the init.lua file itself to avoid recursion
  if not file:match 'init.lua$' then
    -- Extract the module name from the file path
    local module_name = file:match '.*/(.*).lua$'
    if module_name then
      -- Require the module
      require('shricodev.core.autocmds.' .. module_name)
    end
  end
end
