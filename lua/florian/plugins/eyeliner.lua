return {
    "jinh0/eyeliner.nvim",
    config = function()
        require'eyeliner'.setup {
            highlight_on_key = true,
            dim = true,
        }

        vim.api.nvim_create_autocmd('ColorScheme', {
            pattern = '*',
            callback = function()
                local primary = vim.api.nvim_get_hl_by_name("Constant", true)
                local secondary = vim.api.nvim_get_hl_by_name("Define", true)

                vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg = primary.foreground, bold = true })
                vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg = secondary.foreground, bold = true })
            end,
        })
    end
}
