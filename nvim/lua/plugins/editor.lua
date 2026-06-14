return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- highlight and search for todo comments (TODO, FIX, HACK, etc.)
  -- ships with LazyVim; spec'd here to keep config explicit
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    keys = {
      { "<leader>g", "<cmd>Telescope git_files theme=ivy<cr>", desc = "Find Files" },
      { "<leader>f", "<cmd>Telescope find_files theme=ivy<cr>", desc = "Find Files" },
      { "<leader>F", "<cmd>Telescope grep_string theme=ivy<cr>", desc = "Grep strings" },
      { "<leader>rg", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Live grep" },
      {
        ";s",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "Lists Function names, variables, from Treesitter",
      },
    },
    config = function(_, opts)
      require("telescope").load_extension("fzf")
    end,
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "RRethy/nvim-treesitter-endwise", --- Wisely add 'end' in Ruby, Vimscript, Lua, etc.
        event = "InsertEnter",
      },
    },
    event = "BufWinEnter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "dockerfile",
        "git_rebase",
        "gitignore",
        "go",
        "gomod",
        "json",
        "jsonnet",
        "html",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "rust",
        "solidity",
        "sql",
        "toml",
        "vim",
        "terraform",
        "yaml",
      },
    },
  },
}
