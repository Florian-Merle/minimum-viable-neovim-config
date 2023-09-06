return {
    "tpope/vim-fugitive",
    config = function ()
        vim.keymap.set("n", "<leader>gg", function()
            vim.cmd("Git")
        end)
        vim.keymap.set("n", "<leader>gs", function()
            require("gitsigns").stage_hunk()
        end)
        vim.keymap.set("n", "<leader>gu", function()
            require("gitsigns").undo_stage_hunk()
        end)
        vim.keymap.set("n", "<leader>gr", function()
            require("gitsigns").reset_hunk()
        end)
        vim.keymap.set("n", "<leader>gp", function()
            require("gitsigns").preview_hunk()
        end)
    end
}
