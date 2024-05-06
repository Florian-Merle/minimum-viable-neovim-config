return {
    "gabrielpoca/replacer.nvim",
    keys = {
        {"<leader>rr", function ()
            require("replacer").run({
                rename_files = false,
            })
        end},
    },
}
