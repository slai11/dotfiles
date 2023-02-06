return {
  "goolord/alpha-nvim",
  dependencies = "kyazdani42/nvim-web-devicons",
  event = "VimEnter",
  config = function()
    require "alpha".setup(require "alpha.themes.startify".config)
  end
}
