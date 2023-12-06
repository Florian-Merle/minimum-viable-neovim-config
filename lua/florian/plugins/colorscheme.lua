return {
    "catppuccin/nvim",
    dependencies = {
        "f-person/auto-dark-mode.nvim",
    },
    name = "catppuccin",
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme catppuccin-latte]])

        require("catppuccin").setup({
            integrations = {
                cmp = true,
                gitsigns = true,
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = false,
                },
                mason = true,
                native_lsp = {
                    enabled = true,
                },
                nvimtree = true,
                treesitter = true,
            },
            custom_highlights = function(colors)
                return {
                    CurSearch = { bg = colors.flamingo },
                    FzfLuaBufName = { fg = colors.flamingo },
                    FzfLuaBufNr = { fg = colors.flamingo },
                    FzfLuaBufLineNr = { fg = colors.flamingo },
                    FzfLuaBufFlagCur = { fg = colors.flamingo },
                    FzfLuaBufFlagAlt = { fg = colors.flamingo },
                    FzfLuaHeaderBind = { fg = colors.flamingo },
                }
            end
        })

        local auto_dark_mode = require('auto-dark-mode')
        auto_dark_mode.setup({
            update_interval = 1000,
            set_dark_mode = function()
                vim.cmd([[colorscheme catppuccin-frappe]])
            end,
            set_light_mode = function()
                vim.cmd([[colorscheme catppuccin-latte]])
            end,
        })
    end,
}
