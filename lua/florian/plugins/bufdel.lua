return {
    "ojroques/nvim-bufdel",
    keys = {
        { "<leader>x", "<CMD>BufDel<CR>" },
        { "<leader>X", "<CMD>BufDelOthers<CR>" },
        { "<leader>W", "<CMD>BufDelAll<CR>" },
        { "<leader>I", function ()
            -- Keep one window
            vim.cmd('only')
            -- Close all buffers
            vim.cmd("BufDelAll")
        end},
        { "<leader>qq", function ()
            vim.cmd("BufDelAll")
            vim.cmd('confirm qall')
        end},
    },
    opts = {
        quit = false,
    },
}
