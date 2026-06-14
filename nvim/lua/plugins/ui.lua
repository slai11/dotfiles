return {
  -- add symbols-outline
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
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
