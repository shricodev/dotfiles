local M = {}

function M.keymap_namer(prefix, desc)
  return string.format('[%s]: %s', prefix, desc)
end

return M
