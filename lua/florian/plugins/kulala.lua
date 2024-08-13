return   {
    'mistweaverco/kulala.nvim',
    config = function()
        require('kulala').setup()
    end,
    keys = {
        {"<leader>r", ":lua require('kulala').run()<CR>", ft = "http"},
        {"<leader>t", ":lua require('kulala').toggle_view()<CR>", ft = "http"},
    },
};
