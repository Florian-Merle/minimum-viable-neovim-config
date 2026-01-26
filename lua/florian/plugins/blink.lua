return {
  'saghen/blink.cmp',
  version = 'v0.11.0',
  lazy = false, -- lazy loading handled internally
  opts_extend = { "sources.default" },
  opts = {
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
    },
    signature = {
      enabled = false, -- does not work well (window colors are bad and makes it unusable)
    },
    keymap = {
      preset = 'enter',
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
    },
    enabled = function()
      return not vim.tbl_contains({
        "laika",
        "TelescopePrompt",
      }, vim.bo.filetype) and vim.b.completion ~= false
    end,
    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
    },
  },
}
