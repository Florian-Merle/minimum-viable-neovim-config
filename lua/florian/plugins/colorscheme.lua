return {
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    -- weird shit warning here
    -- I don't know why, but if I do not apply the theme twice, then there will be issues
    -- with the color of , ; and \
    -- don't ask how I realized the theme should be applied twice
    vim.cmd.colorscheme("github_light")
    vim.cmd.colorscheme("github_light")
  end,
}
