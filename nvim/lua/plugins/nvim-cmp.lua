return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
    "hrsh7th/cmp-omni",
    "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim builtin LSP client
    "hrsh7th/cmp-path", -- nvim-cmp source for path
    "hrsh7th/cmp-vsnip", -- nvim-cmp source for vim-vsnip
    "hrsh7th/cmp-cmdline", -- nvim-cmp source for vim's cmdline
    { "hrsh7th/vim-vsnip", lazy = true },
    { "williamboman/mason-lspconfig.nvim", lazy = true },
    {
      "onsails/lspkind.nvim", -- vscode-like pictograms for neovim lsp completion items
      dependencies = "mortepau/codicons.nvim" -- A plugin simplifying the task of working with VS Code codicons in Neovim
    }
  },
  config = function()
    vim.o.completeopt = "menu,menuone"

    -- Set up nvim-cmp.
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      formatting = {
        format = require("lspkind").cmp_format({ preset = "codicons" })
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
        ["<C-f>"]     = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"]     = cmp.mapping.abort(),
        ["<CR>"]      = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = "omni" },
        { name = "nvim_lsp" },
        { name = "vsnip" }, -- For vsnip users.
      }, {
        { name = "buffer" },
        { name = "cmdline" },
        { name = "path" },
      }),
    })

    cmp.setup.filetype("gitcommit", {
      sources = {
        { name = "buffer" },
      }
    })

    cmp.setup.cmdline({ "/", "?" }, {
      sources = {
        { name = "buffer" }
      }
    })

    cmp.setup.cmdline(":", {
      sources = {
        { name = "cmdline" }
      }
    })
  end
}
