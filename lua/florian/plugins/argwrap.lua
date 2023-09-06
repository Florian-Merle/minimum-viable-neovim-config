return {
    "FooSoft/vim-argwrap",
    config = function()
        vim.keymap.set("n", "<leader>j", "<cmd>ArgWrap<cr>")
    end,
}
