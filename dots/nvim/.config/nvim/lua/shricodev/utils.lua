local M = {}

function M.keymap_namer(prefix, desc)
  return string.format('[%s]: %s', prefix, desc)
end

--- Derives the plugin name from the calling file's name.
--- e.g. calling from fzf-lua.lua returns 'fzf-lua'
function M.plugin_name()
  local source = debug.getinfo(2, 'S').source
  return source:match('([^/\\]+)%.lua$') or 'unknown'
end

return M
