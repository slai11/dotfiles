return {
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
        jsonnet_ls = {},
        terraformls = {},
      },
    },
  },

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
}
