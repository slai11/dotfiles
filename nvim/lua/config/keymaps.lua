-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Shortcuts
vim.keymap.set("n", "<leader>w", "<cmd>w!<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>")

vim.keymap.set("n", "H", "gT", { noremap = true })
vim.keymap.set("n", "L", "gt", { noremap = true })

for var = 0, 9 do
  vim.keymap.set("n", string.format("<leader>%i", var), string.format("%igt", var), { noremap = true })
end

vim.keymap.set("n", "<S-Up>", ":m-2<CR>", { noremap = true })
vim.keymap.set("n", "<S-Down>", ":m+<CR>", { noremap = true })
vim.keymap.set("i", "<S-Up>", "<Esc>:m-2<CR>", { noremap = true })
vim.keymap.set("i", "<S-Down>", "<Esc>:m+<CR>", { noremap = true })

local save_fmt_augroup = vim.api.nvim_create_augroup("save_fmt", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  group = save_fmt_augroup,
  command = ":%s/\\s\\+$//e", -- remove trailing whitespace on save (Mastering Vim Quickly)
})
