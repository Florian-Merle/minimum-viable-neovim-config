local cwd = function()
    local oil = require("oil");
    local entry = oil.get_cursor_entry()
    local dir = oil.get_current_dir()

    if not entry or not dir then
        return
    end

    local cwd = dir .. entry.name
    if vim.fn.isdirectory(cwd) ~= 0 == false then
        cwd = vim.fn.fnamemodify(cwd, ":p:h")
    end

    return cwd
end

return {
    'stevearc/oil.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    keys = {
        {"-", "<cmd> Oil <CR>"},
    },
    opts = {
        use_default_keymaps = false,
        keymaps = {
            ["<CR>"] = "actions.select",
            ["<leader><CR>"] = "actions.select_vsplit",
            ["<leader>p"] = "actions.preview",
            ["<C-r>"] = "actions.refresh",
            ["-"] = "actions.parent",
            ["="] = "actions.open_cwd",
            ["<leader>fd"] = function()
                local path = cwd();
                if path == nil then
                    return
                end

                vim.cmd('Telescope find_files no_ignore=true cwd=' .. path)
            end,
            ["<leader>fg"] = function()
                local path = cwd();
                if path == nil then
                    return
                end

                vim.cmd('Telescope live_grep no_ignore=true cwd=' .. path)
            end,
        },
        view_options = {
            show_hidden = true,
        },
        buf_options = {
            buflisted = true, -- so the buffer is not volatile
            bufhidden = "hide",
        },
        lsp_file_methods = {
            timeout_ms = 1000,
            autosave_changes = false,
        },
        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = false,
    },
};
