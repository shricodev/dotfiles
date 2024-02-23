return {
  "tpope/vim-fugitive",
  keys = {
    { "<leader>gv", "<cmd>G<CR>", desc = "Open the git status" },
    { "<leader>gq", "<cmd>G<CR><cmd>q<CR>", desc = "Close the open git status" },
    { "<leader>gw", "<cmd>GWrite<CR>", desc = "Write and stage the changes" },
    { "<leader>gr", "<cmd>Gread<CR>", desc = "Gread" },
    { "<leader>gh", "<cmd>diffget //2<CR>", desc = "diffget //2 (get the diff from left)" },
    { "<leader>gl", "<cmd>diffget //3<CR>", desc = "diffget //3 (get the diff from right)" },
    { "<leader>gP", "<cmd>Git push<CR>", desc = "Push the changes to the remote" },
  },
}
