return {
  -- note-taking against existing Obsidian vaults
  -- uses the actively-maintained fork (epwalsh/obsidian.nvim is archived)
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      -- the workspace is picked automatically based on the file being edited
      workspaces = {
        { name = "2ndbrain", path = "~/Documents/2ndbrain" },
        { name = "sc1-workbench", path = "~/allium/sc1-workbench" },
        { name = "my-wiki", path = "~/allium/my-wiki" },
      },
    },
  },
}
