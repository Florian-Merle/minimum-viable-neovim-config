return {
    "tpope/vim-fugitive",
    cmd = {
        "Git",
    },
    keys = {
        {"<leader>gg", "<cmd> Git<CR>"},
        {"<leader>gb", function()
            local config = {
                excluded_buftypes = {
                    "nofile",
                },
            }

            if vim.tbl_contains(config.excluded_buftypes, vim.bo.buftype) then
                return
            end

            if "fugitiveblame" == vim.bo.filetype then
                vim.cmd("q")
            else
                vim.cmd("Git blame --date=format:'%Y-%m-%d'")
            end
        end},
    },
}
