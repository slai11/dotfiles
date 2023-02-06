vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamed"

vim.opt.incsearch  = true -- Find the next match as we type the search
vim.opt.hlsearch   = true -- Highlight searches by default
vim.opt.ignorecase = true -- Ignore case when searching...
vim.opt.smartcase  = true -- ...unless we type a capital
vim.opt.grepprg    = "rg --vimgrep --smart-case --follow"

vim.g.rubycomplete_buffer_loading = true

-- Space as leader key
vim.g.mapleader = ","

-- Shortcuts
vim.keymap.set("n", "<leader>w", ":w!<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>wq", ":wq<cr>")

vim.keymap.set("n", "H", "gT", { noremap = true })
vim.keymap.set("n", "L", "gt", { noremap = true })

for var = 0, 9 do
  vim.keymap.set("n", string.format("<leader>%i", var), string.format("%igt", var), { noremap = true })
end

vim.keymap.set("n", "<S-Up>", ":m-2<CR>", { noremap = true })
vim.keymap.set("n", "<S-Down>", ":m+<CR>", { noremap = true })
vim.keymap.set("i", "<S-Up>", "<Esc>:m-2<CR>", { noremap = true })
vim.keymap.set("i", "<S-Down>", "<Esc>:m+<CR>", { noremap = true })

vim.opt.termguicolors = true

local save_fmt_augroup = vim.api.nvim_create_augroup("save_fmt", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  group = save_fmt_augroup,
  command = ":%s/\\s\\+$//e" -- remove trailing whitespace on save (Mastering Vim Quickly)
})
