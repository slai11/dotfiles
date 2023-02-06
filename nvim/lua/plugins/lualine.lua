-- Color for LSP highlights (gruvbox dark)
local colors = {
  cyan = "#8ec07c",
  magenta = "#d3869b",
  blue = "#458588",
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  opts = {
    options = {
      icons_enabled = true,
      ignore_focus = { "lazy", "neotest-summary", "Outline", "Trouble" },
      disabled_filetypes = { "lazy", "neotest-summary", "Outline", "Trouble" },
      globalstatus = true,
      theme = "nord",
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
        {
          "lsp_progress",
          colors = {
            percentage      = colors.cyan,
            title           = colors.blue,
            message         = colors.blue,
            spinner         = colors.cyan,
            lsp_client_name = colors.magenta,
            use             = true,
          },
          separators = {
            component = " ",
            progress = " | ",
            percentage = { pre = "", post = "%% " },
            title = { pre = "", post = ": " },
            lsp_client_name = { pre = "[", post = "]" },
            spinner = { pre = "", post = "" },
            message = { pre = "(", post = ")", commenced = "In Progress", completed = "Completed" },
          },
          display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
          timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
          spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
        }
      }
    }
  }
}
