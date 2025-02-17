return {
  'saghen/blink.cmp',
  version = 'v0.11.0',
  lazy = false, -- lazy loading handled internally
  dependencies =  {
    { "giuxtaposition/blink-cmp-copilot" },
  },
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
        "copilot",
      },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,
          transform_items = function(_, items)
            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
            local kind_idx = #CompletionItemKind + 1
            CompletionItemKind[kind_idx] = "Copilot"
            for _, item in ipairs(items) do
              item.kind = kind_idx
            end
            return items
          end,
        },
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
      kind_icons = {
        Copilot = "",
        Text = '󰉿',
        Method = '󰊕',
        Function = '󰊕',
        Constructor = '󰒓',

        Field = '󰜢',
        Variable = '󰆦',
        Property = '󰖷',

        Class = '󱡠',
        Interface = '󱡠',
        Struct = '󱡠',
        Module = '󰅩',

        Unit = '󰪚',
        Value = '󰦨',
        Enum = '󰦨',
        EnumMember = '󰦨',

        Keyword = '󰻾',
        Constant = '󰏿',

        Snippet = '󱄽',
        Color = '󰏘',
        File = '󰈔',
        Reference = '󰬲',
        Folder = '󰉋',
        Event = '󱐋',
        Operator = '󰪚',
        TypeParameter = '󰬛',
      },
    },
  },
}
