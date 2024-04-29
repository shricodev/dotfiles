return {
  'ggandor/leap.nvim',
  keys = {
    { 's', mode = { 'n', 'x', 'o' }, desc = '[Leap]: Leap forward to' },
    { 'S', mode = { 'n', 'x', 'o' }, desc = '[Leap]: Leap backward to' },
    { 'gs', mode = { 'n', 'x', 'o' }, desc = '[Leap]: Leap from windows' },
  },
  config = function()
    require('leap').create_default_mappings()
  end,
}
