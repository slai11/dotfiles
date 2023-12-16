return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>g", "<cmd>Telescope git_files<cr>", desc = "Find Files" },
    { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>F", "<cmd>Telescope grep_string<cr>", desc = "Grep strings" },
    { "<leader>rg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
  }
}
