vim.g.mapleader = " "

vim.keymap.set("n", "<leader>qq", ":x! <CR>")
vim.keymap.set("n", "<C-s>", ":w <CR>")
vim.keymap.set("n", "<leader>ww", ":w <CR>")
vim.keymap.set("n", "<leader>el", "<cmd>e #<1<CR>")

vim.keymap.set("n", "Q", "<nop>")

-- Keep register when pasting
-- https://vi.stackexchange.com/a/39907
vim.keymap.set("x", "p", "P", { silent = true })

-- Center view after moving verticaly
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>la", "<cmd> Lazy <CR>")
vim.keymap.set("n", "<Esc>", ":noh <CR>")
