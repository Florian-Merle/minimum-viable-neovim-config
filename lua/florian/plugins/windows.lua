vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
        vim.cmd("WindowsEqualize")
    end,
})

return {
    "anuvyklack/windows.nvim",
    dependencies = { "anuvyklack/middleclass" },
    opts = {},
    event = "VimResized",
    cmd = { "WindowsMaximize", "WindowsEqualize" },
    keys = {
        { "<leader>z", "<CMD>WindowsMaximize<CR>" },
        { "<leader>=", "<CMD>WindowsEqualize<CR>" },
    },
}
