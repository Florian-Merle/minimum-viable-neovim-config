return {
    "romgrk/barbar.nvim",
    init = function() vim.g.barbar_auto_setup = false end,
    config = function ()
        require'barbar'.setup {
            animation = false,
            icons = {
                button = '',
            },
        }

        vim.keymap.set("n", "<tab>", ":BufferNext <CR>")
        vim.keymap.set("n", "<S-tab>", ":BufferPrevious <CR>")

        vim.keymap.set("n", "<leader>x", ":BufferClose <CR>")
        vim.keymap.set("n", "<leader>X", ":BufferCloseAllButCurrent <CR>")
        vim.keymap.set("n", "<leader>W", ":BufferCloseAllButCurrent <CR> :BufferClose <CR>")
    end,
}
