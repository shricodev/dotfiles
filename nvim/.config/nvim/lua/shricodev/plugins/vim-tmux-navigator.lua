return {
  'christoomey/vim-tmux-navigator',
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
    'TmuxNavigatePrevious',
  },
  keys = {
    { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', desc = '[TmuxNavigate]: Navigate to the left tmux pane' },
    { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>', desc = '[TmuxNavigate]: Navigate to the down tmux pane' },
    { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>', desc = '[TmuxNavigate]: Navigate to the up tmux pane' },
    { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>', desc = '[TmuxNavigate]: Navigate to the right tmux pane' },
    { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>', desc = '[TmuxNavigate]: Navigate to the previous tmux pane' },
  },
}
