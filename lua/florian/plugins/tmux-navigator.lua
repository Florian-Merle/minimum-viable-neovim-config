return {
    "christoomey/vim-tmux-navigator",
    cmd = { "TmuxNavigateLeft", "TmuxNavigateRight", "TmuxNavigateTop", "TmuxNavigateBottom" },
    keys = {
        {"<A-h>", ":TmuxNavigateLeft<CR>"},
        {"<A-j>", ":TmuxNavigateDown<CR>"},
        {"<A-k>", ":TmuxNavigateUp<CR>"},
        {"<A-l>", ":TmuxNavigateRight<CR>"},
    },
}
