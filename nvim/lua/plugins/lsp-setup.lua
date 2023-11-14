-- lsp-setup.nvim (https://github.com/junnplus/lsp-setup.nvim)
--   A simple wrapper for nvim-lspconfig and mason-lspconfig to easily setup LSP servers.

return {
  "junnplus/lsp-setup.nvim",
  event = "BufReadPre",
  dependencies = {
    {
      "neovim/nvim-lspconfig", -- Quickstart configs for Nvim LSP
      dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim builtin LSP client
        {
          --- uses Mason to ensure installation of user specified LSP servers and will tell nvim-lspconfig what command
          --- to use to launch those servers.
          "williamboman/mason-lspconfig.nvim",
          dependencies = "williamboman/mason.nvim",
        },
        "b0o/schemastore.nvim", -- 🛍  JSON schemas for Neovim
      },
    },
    {
      --- Uses Mason to ensure installation of user specified LSP servers and will tell nvim-lspconfig what command
      --- to use to launch those servers.
      "williamboman/mason-lspconfig.nvim",
      dependencies = "williamboman/mason.nvim",
    }
  },
  init = function()
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local m = require("mapx")
    m.nnoremap("[g", ":lua vim.diagnostic.goto_prev()<CR>", "Next LSP diagnostic")
    m.nnoremap("]g", ":lua vim.diagnostic.goto_next()<CR>", "Previous LSP diagnostic")
    m.nnoremap("<f2>", ":lua vim.lsp.buf.rename()<CR>", "Rename symbol")
    m.nnoremap("K", ":lua vim.lsp.buf.hover()<CR>", "Hover")
    m.nnoremap("<leader>K", ":lua vim.lsp.buf.signature_help()<CR>", "Signature help")
    m.nname("<leader>l", "LSP")
    --m.nnoremap("<leader>lca", ":lua vim.lsp.buf.code_action()<CR>", "List code actions") -- Replaced with nvim-code-action-menu
    m.nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>", "Go to definition")
    m.nnoremap("<leader>lD", ":lua vim.lsp.buf.declaration()<CR>", "Go to declaration")
    m.nnoremap("<leader>ly", ":lua vim.lsp.buf.type_definition()<CR>", "Go to type definition")
    m.nnoremap("<leader>li", ":lua vim.lsp.buf.implementation()<CR>", "Go to implementation")
    --m.nnoremap("<leader>lr", ":TroubleToggle lsp_references<CR>", "References")
    --m.nnoremap("<leader>ld", ":TroubleToggle lsp_definitions<CR>", "Definitions")
    --m.nnoremap("<C-]>", ":TroubleToggle lsp_definitions<CR>", "Definitions")
    m.nnoremap("<leader>lf", ":lua vim.lsp.buf.format({ async = true })<CR>", "Format buffer")
    m.nname("<leader>lw", "Workspace")
    m.nnoremap("<leader>lwa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", "Add workspace folder")
    m.nnoremap("<leader>lwl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
      "List workspace folders")
  end,
  config = function()
    local servers = {
      bashls = {},
      clangd = {},
      dockerls = {},
      gopls = {},
      jsonnet_ls = {
        settings = {
          cmd = {
    "jsonnet-language-server",
    "-J",
    "/Users/sylvesterchin/work/runbooks/libsonnet",
    "-J",
    "/Users/sylvesterchin/work/runbooks/vendor",
    "-J",
    "/Users/sylvesterchin/work/runbooks/dashboards",
    "-J",
    "/Users/sylvesterchin/work/runbooks/services",
    "-J",
    "/Users/sylvesterchin/work/runbooks/metrics-catalog",
  },
        },
      },
      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      marksman = {},
      ruby_ls = {},
      rust_analyzer = {},
      sqlls = {},
      pyright = {},
      taplo = {},
      terraformls = {},
      vimls = {},
      yamlls = {
        settings = {
          yaml = {
            hover = true,
            completion = true,
            validate = true,
            schemastore = {
              enable = true,
              url = "https://www.schemastore.org/api/json/catalog.json",
            },
          },
        },
      },
    }

    require("lsp-setup").setup({
      default_mappings = false,

      servers = servers,
    })
  end
}
