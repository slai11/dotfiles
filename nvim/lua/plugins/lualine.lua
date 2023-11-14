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
      }
    }
  }
}
