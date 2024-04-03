return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>ham', "<cmd>lua require('harpoon.mark').add_file()<CR>", desc = 'Mark file with harpoon' },
    { '<leader>han', "<cmd>lua require('harpoon.ui').nav_next()<CR>", desc = 'Go to next harpoon mark' },
    { '<leader>hap', "<cmd>lua require('harpoon.ui').nav_prev()<CR>", desc = 'Go to previous harpoon mark' },
    { '<leader>hav', ':Telescope harpoon marks<CR>', desc = 'Toggle the harpoon quick menu' },
  },
}
