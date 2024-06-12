return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = false,
      component_separators = { left = '| ', right = ' |'},
      section_separators = '',
    },
    sections = {
      lualine_c = {
        {
          'filename',
          path = 1,
        },
      },
      lualine_x = {
        "filetype",
      },
    },
    extensions = {
      "lazy",
      "mason",
      "oil",
      "fugitive",
      "quickfix",
    },
  },
}
