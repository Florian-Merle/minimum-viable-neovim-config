return {
    "ojroques/nvim-bufdel",
    keys = {
        { "<leader>x", "<CMD>BufDel<CR>" },
        { "<leader>X", "<CMD>BufDelOthers<CR>" },
        { "<leader>W", "<CMD>BufDelAll<CR>" },
        { "<leader>qq", function ()
            vim.cmd("BufDelAll")
            vim.cmd('confirm qall')
        end},
    },
    opts = {
        quit = false,
    },
}
