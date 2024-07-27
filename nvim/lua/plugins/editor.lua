return {
  {
    "folke/flash.nvim",
    enable = false,
  },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
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
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
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
        "help",
        "html",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "ruby",
        "rust",
        "sql",
        "toml",
        "vim",
        "terraform",
        "yaml",
      },
    },
    config = function(plugin, opts)
      if plugin.ensure_installed then
        require("lazyvim.util").deprecate("treesitter.ensure_installed", "treesitter.opts.ensure_installed")
      end
      require("nvim-treesitter.configs").setup(opts)

      local opt = vim.opt

      opt.foldenable = false -- Disable folding at startup.
      -- vim.opt.foldmethod = "expr"
      -- vim.opt.foldexpr   = "nvim_treesitter#foldexpr()"
      ---WORKAROUND
      vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
        group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
        callback = function()
          if vim.bo.filetype ~= "home-assistant" then
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
          end
        end,
      })
      ---ENDWORKAROUND
    end,
  },
}
