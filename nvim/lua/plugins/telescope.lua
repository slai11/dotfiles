return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>F", "<cmd>Telescope grep_string<cr>", desc = "Grep strings" },
    { "<leader>rg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
  },
  opts = {
    pickers = {
      find_files = {
        theme = "ivy",
      },
      live_grep = {
        theme = "ivy",
      },
      grep_string = {
        theme = "ivy",
      },
    },
  },
}
