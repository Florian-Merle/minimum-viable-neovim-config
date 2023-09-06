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
                nvimtree = true,
                treesitter = true,
            }
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
