return {
    "anuvyklack/windows.nvim",
    dependencies = { "anuvyklack/middleclass" },
    opts = {},
    cmd = { "WindowsMaximize", "WindowsEqualize" },
    keys = {
        { "<leader>z", "<CMD>WindowsMaximize<CR>" },
        { "<leader>=", "<CMD>WindowsEqualize<CR>" },
    },
}
