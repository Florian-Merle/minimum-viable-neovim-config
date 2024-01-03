return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "ibhagwan/fzf-lua",
    },
    config = true,
    keys = {
        {"<leader>gg", function ()
            require('neogit').open()
        end},
    },
}
