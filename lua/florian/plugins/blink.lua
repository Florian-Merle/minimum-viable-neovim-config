return {
  'saghen/blink.cmp',
  version = 'v0.11.0',
  lazy = false, -- lazy loading handled internally
  dependencies =  {},
  opts_extend = { "sources.default" },
  opts = {
    keymap = {
      preset = 'enter',
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
    },
    enabled = function()
      return not vim.tbl_contains({ "laika" }, vim.bo.filetype)
    end,
  }
}
