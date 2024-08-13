return   {
    'mistweaverco/kulala.nvim',
    config = function()
        require('kulala').setup()
    end,
    keys = {
        {"<leader>r", ":lua require('kulala').run()<CR>", ft = "http"},
        {"<leader>t", ":lua require('kulala').toggle_view()<CR>", ft = "http"},
        {"[[", ":lua require('kulala').jump_prev()<CR>", ft = "http"},
        {"]]", ":lua require('kulala').jump_next()<CR>", ft = "http"},
    },
};
