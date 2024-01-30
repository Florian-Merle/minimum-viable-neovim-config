return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        { "junegunn/fzf", build = "./install --bin" },
    },
    config = function()
        local actions = require("fzf-lua.actions")

        require("fzf-lua").setup({
            fzf_colors = {
                ["fg"] = { "fg", "CursorLine" },
                ["bg"] = { "bg", "Normal" },
                ["hl"] = { "fg", "CursorLine" },
                ["fg+"] = { "fg", "Normal" },
                ["bg+"] = { "bg", "CursorLine" },
                ["hl+"] = { "fg", "Normal" },
                ["info"] = { "fg", "Comment" },
                ["prompt"] = { "fg", "Normal" },
                ["pointer"] = { "fg", "Exception" },
                ["marker"] = { "fg", "Keyword" },
                ["spinner"] = { "fg", "Comment" },
                ["header"] = { "fg", "Comment" },
                ["gutter"] = { "bg", "CursorLine" },
            },
            keymap = {
                fzf = {
                    ["alt-u"] = "half-page-up",
                    ["alt-d"] = "half-page-down",
                    ["alt-a"] = "toggle-all",
                },
            },
            files = {
                actions = {
                    ["default"] = actions.file_edit_or_qf,
                    ["alt-r"] = actions.toggle_ignore,
                    ["alt-q"] = actions.file_sel_to_qf,
                },
            },
            grep = {
                rg_opts = "--column --line-number --no-heading --color=never --smart-case --max-columns=4096 -e",
            },
            winopts = {
                split = "botright new",
                border = 'single',
                preview = {
                    horizontal = 'right:50%',
                },
            },
        })
    end,
    cmd = { "FzfLua" },
    keys = {
        {"<leader>.", "<cmd>FzfLua live_grep <CR>"},
        {"<leader> ", "<cmd>FzfLua files <CR>"},
        {"<leader>ff", function()
            local dir = require("florian.utils").buffer_dir()
            vim.cmd("FzfLua files cwd=" .. dir)
        end},

        {"<leader>fo", "<cmd>FzfLua oldfiles <CR>"},
        {"<leader>bb", "<cmd>FzfLua buffers <CR>"},
        {"<leader>fs", "<cmd>FzfLua grep_cWORD <CR>"},
        {"<leader>fs", "<cmd>FzfLua grep_visual <CR>", mode="v"},

        {"gd", "<cmd>FzfLua lsp_definitions <CR>"},
        {"gr", "<cmd>FzfLua lsp_references <CR>"},
        {"gi", "<cmd>FzfLua lsp_implementations <CR>"},

        {"<leader>ca", "<cmd>FzfLua lsp_code_actions <CR>"},

        -- TODO: Test these commands, not sure I'll keep all of them
        {"<C-p>", "<cmd>FzfLua resume <CR>"},
        {"<C-f>", function ()
            if (vim.bo.filetype == "dirbuf") then
                vim.cmd("FzfLua blines")
            else
                vim.cmd("FzfLua lgrep_curbuf")
            end
        end},
        {"<leader>,", "<cmd>FzfLua lsp_finder <CR>"},
        {"<leader>?", "<cmd>FzfLua lsp_document_diagnostics <CR>"},
        {"<leader>ss", "<cmd>FzfLua lsp_document_symbols <CR>"},
        {"<leader>rr", "<cmd>FzfLua live_grep_resume <CR>"},

    },
}
