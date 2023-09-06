return {
    "romgrk/barbar.nvim",
    init = function() vim.g.barbar_auto_setup = false end,
    config = function ()
        require'barbar'.setup {
            animation = false,
            auto_hide = true,
            icons = {
                filetype = {
                    enabled = false,
                },
            },
        }

        vim.keymap.set("n", "<tab>", ":BufferNext <CR>")
        vim.keymap.set("n", "<S-tab>", ":BufferPrevious <CR>")
    end
}
