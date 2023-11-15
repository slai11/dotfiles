return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({'max-perf'})
  end,
  keys = {
    { "<leader>f", "<cmd>FzfLua git_files<cr>", desc = "Find Files" },
    { "<leader>F", "<cmd>FzfLua grep_cword<cr>", desc = "Grep strings" },
    { "<leader>rg", "<cmd>FzfLua live_grep_native<cr>", desc = "Live grep" },
  },
}
