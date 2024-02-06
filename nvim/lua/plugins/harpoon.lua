return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<CR>", desc = "Mark file with harpoon" },
    { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<CR>", desc = "Go to next harpoon mark" },
    { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", desc = "Go to previous harpoon mark" },
    { "<leader>hv", ":Telescope harpoon marks<CR>", desc = "Toggle the harpoon quick menu" },
  },
}
