-- Neotest (https://github.com/nvim-neotest/neotest)
--  An extensible framework for interacting with tests within NeoVim.

---@format disable-next
local keys = {
  { '<leader>rt', function() require('neotest').run.run() end,                     desc = 'Run the nearest test' },
  { '<leader>rd', function() require('neotest').run.run({ strategy = 'dap' }) end, desc = 'Debug the nearest test' },
  { '<leader>rf', function() require('neotest').run.run(vim.fn.expand('%')) end,   desc = 'Run the current file' },
  { '<leader>rl', function() require('neotest').run.run_last() end,                desc = 'Repeat last test run' },
  { '<leader>rr', function() require('neotest').summary.open() end,                desc = 'Open test summary' },
  { '<leader>ro', function() require('neotest').output.open({ enter = true }) end, desc = 'Open test output' },
}

return {
  "nvim-neotest/neotest",
  ft = { "go", "ruby" },
  keys = keys,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-go",
    {
      "olimorris/neotest-rspec",
      keys = {
        {
          "<leader>rb",
          ":Dispatch bin/rspec $(git diff --name-only --diff-filter=AM master | grep 'spec/')<CR>",
          desc = "Run MR tests",
        }
      }
    }
  },
  config = function()
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-go") {
          experimental = {
            test_table = true,
          },
          args = { "-count=1", "-timeout=60s" }
        },
        require("neotest-rspec")({
          rspec_cmd = function()
            return vim.tbl_flatten({
              "bundle",
              "exec",
              "rspec",
            })
          end
        }),
      },
      icons = {
        expanded           = "",
        child_prefix       = "",
        child_indent       = "",
        final_child_prefix = "",
        non_collapsible    = "",
        collapsed          = "",

        passed  = "*",
        running = "",
        failed  = "!",
        unknown = ""
      },
    })
  end
}
