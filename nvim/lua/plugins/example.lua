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

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
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
      { "<leader>g", "<cmd>Telescope git_files<cr>", desc = "Find Files" },
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>F", "<cmd>Telescope grep_string<cr>", desc = "Grep strings" },
      { "<leader>rg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
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
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- lsps will be automatically installed with mason and loaded with lspconfig
        bashls = {},
        clangd = {},
        dockerls = {},
        gopls = {},
        pyright = {},
        ruby_ls = {},
      },
    },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
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
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        globalstatus = true,
        theme = "gruvbox",
      },

      extensions = {
        "fugitive",
        "man",
        "nvim-dap-ui",
        "nvim-tree",
        "quickfix",
        "symbols-outline",
      },

      sections = {
        lualine_c = {
          {
            "filename",
            show_filename_only = false,
            path = 3,
            shorting_target = 80,
          },
        },
      },
    },
  },

  -- use mini.starter instead of alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
