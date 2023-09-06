return {
    "numToStr/Comment.nvim",
    keys = {
        {"<leader>/", function()
            require("Comment.api").toggle.linewise.current()
        end},
        {"<leader>/","<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", mode="v"},
    },
}
