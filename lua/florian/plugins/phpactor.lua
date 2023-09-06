return {
    dir = "~/.tools/phpactor",
    config = function ()
        vim.keymap.set("n", "<leader>cp", function ()
            vim.cmd("PhpactorContextMenu")
        end)
        vim.keymap.set("n", "<leader>cc", function ()
            vim.cmd("PhpactorCopyClassName")
        end)
    end
}
