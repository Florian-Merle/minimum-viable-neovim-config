local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

vim.opt.undofile = true

vim.opt.relativenumber = true
vim.opt.number = true

-- needed so oil preview opens on the right side
vim.opt.splitright = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.clipboard:append("unnamedplus")

vim.opt.scrolloff = 8

vim.opt.termguicolors = true

local yank_group = augroup("HighlightYank", {})
autocmd('TextYankPost', {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 120,
    })
  end,
})

-- needed for kulala
vim.filetype.add({
  extension = {
    ['http'] = 'http',
  },
})
