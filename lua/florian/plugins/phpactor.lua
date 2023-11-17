return {
    dir = "~/.tools/phpactor",
    config = function ()
        -- As this is missing from gbprod/phpactor.nvim, we need to install
        -- the old phpactor vim plugin.
        vim.keymap.set("n", "<leader>cc", function ()
            vim.cmd("PhpactorCopyClassName")
        end)
    end
}
