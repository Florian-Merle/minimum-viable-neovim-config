return {
    "gbprod/phpactor.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("phpactor").setup({
            install = {
                path = "~/.tools/",
            },
            lspconfig = {
                enabled = false,
            },
        })

        vim.keymap.set("n", "<leader>cp", function ()
            vim.cmd("PhpActor context_menu")
        end)
        vim.keymap.set("n", "<leader>cc", function ()
            vim.cmd("PhpactorCopyClassName")
        end)
    end
}
