local wezterm = require 'wezterm'

wezterm.on('gui-startup', function(cmd)
  local _, _, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

return {
  unicode_version = 15,
  color_scheme = 'Catppuccin Macchiato',
  adjust_window_size_when_changing_font_size = false,
  audible_bell = 'Disabled',
  enable_tab_bar = false,
  font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Bold', stretch = 'Normal', style = 'Normal' }),
  hide_mouse_cursor_when_typing = true,
  hide_tab_bar_if_only_one_tab = true,
  line_height = 1.2,
  font_size = 12.3,
  exit_behavior = 'Close',
  disable_default_key_bindings = true,
  cursor_blink_rate = 0,
  window_close_confirmation = 'AlwaysPrompt',
  scrollback_lines = 10000,
  use_dead_keys = false,
  -- Make the cursor red if prev command failed, green if succeeded
  -- force_reverse_video_cursor = true,
  show_update_window = true,
  window_padding = {
    left = '0.3cell',
    right = 0,
    top = '0.1cell',
    bottom = 0,
  },
  window_background_opacity = 1,
  inactive_pane_hsb = {
    brightness = 0.5,
    saturation = 0.24,
  },
  window_decorations = 'RESIZE',
  keys = {
    { action = wezterm.action.ActivateCommandPalette, mods = 'CTRL|SHIFT', key = 'P' },
    { action = wezterm.action.CopyTo 'Clipboard', mods = 'CTRL|SHIFT', key = 'C' },
    { action = wezterm.action.DecreaseFontSize, mods = 'CTRL', key = '-' },
    { action = wezterm.action.IncreaseFontSize, mods = 'CTRL', key = '=' },
    { action = wezterm.action.Nop, mods = 'ALT', key = 'Enter' },
    { action = wezterm.action.PasteFrom 'Clipboard', mods = 'CTRL|SHIFT', key = 'V' },
    { action = wezterm.action.ResetFontSize, mods = 'CTRL', key = '0' },
    {
      action = wezterm.action.ToggleFullScreen,
      mods = 'CTRL',
      key = 'F',
    },
  },
  mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = wezterm.action.OpenLinkAtMouseCursor,
    },
  },
}
