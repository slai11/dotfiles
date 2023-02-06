return {
  --### Key mappings management

  --### Color
  "shaunsingh/nord.nvim",
  "EdenEast/nightfox.nvim",

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordfox",
    },
  },

  --### Search
  "tpope/vim-abolish", -- abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word

  "arkav/lualine-lsp-progress", -- LSP Progress lualine component

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },

  --### Snippets
  { "hrsh7th/vim-vsnip", lazy = true }, -- Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.

  --### Session management
  "farmergreg/vim-lastplace", -- Intelligently reopen files at your last edit position in Vim.

  --### Editor enhancements
  "junegunn/vim-easy-align", -- 🌻 A Vim alignment plugin
  "AndrewRadev/splitjoin.vim", -- Switch between single-line and multiline forms of code
  { "tpope/vim-repeat", keys = "." }, -- repeat.vim: enable repeating supported plugin maps with '.'
  {
    "tpope/vim-surround", -- surround.vim: Delete/change/add parentheses/quotes/XML-tags/much more with ease
    event = "VeryLazy",
  },

  --### Other
  "tmux-plugins/vim-tmux", -- Vim plugin for .tmux.conf
  {
    "tpope/vim-dispatch", -- dispatch.vim: Asynchronous build and test dispatcher
    cmd = { "Dispatch", "Make", "Focus", "Start" }
  },
  {
    "tpope/vim-bundler", -- bundler.vim: Lightweight support for Ruby's Bundler
    ft = "ruby",
    cmd = { "Bundle", "Bopen", "Bsplit", "Btabedit" }
  },
  { "tpope/vim-rails", ft = "ruby" }, -- rails.vim: Ruby on Rails power tools
  { "bfontaine/Brewfile.vim", ft = "ruby" }, -- Brewfile syntax for Vim
  "wsdjeg/vim-fetch", -- Make Vim handle line and column numbers in file names with a minimum of fuss

  {
    "iamcco/markdown-preview.nvim", -- markdown preview plugin for (neo)vim
    cmd = { "MarkdownPreview", "MarkdownPreviewToggle" },
    build = function() vim.fn["mkdp#util#install"]() end, -- install without yarn or npm
  },
}
