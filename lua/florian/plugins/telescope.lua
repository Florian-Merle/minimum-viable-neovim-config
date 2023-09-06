return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.4",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- see https://www.reddit.com/r/neovim/comments/10nzgdx/im_trying_to_set_up_telescope_with_fzfnative_and/j6cah4a/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        "nvim-telescope/telescope-file-browser.nvim",
    },
    cmd = { "Telescope"},
    config = function()
        local telescope = require("telescope")

        telescope.setup{
            defaults = {
                file_ignore_patterns = { ".git/" },

                -- hack to set ivy theme as default
                layout_strategy = 'bottom_pane',
                layout_config = {
                    height = 25,
                },
                border = true,
                sorting_strategy = "ascending",
                borderchars = {
                    prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
                    results = { " " },
                    preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                },
            },
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                    mappings = {
                        n = {
                            ["."] = require("florian.utils").live_grep,
                        },
                    },
                },
            }
        }

        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
    end,
    keys = {
        {"<leader>.", ":Telescope live_grep <CR>"},
        {"<leader> ", "<cmd>Telescope find_files hidden=true <CR>"},
        {"<C-f>", "<cmd>Telescope current_buffer_fuzzy_find <CR>"},
        {"<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>"},
        {"<leader>fo", "<cmd>Telescope oldfiles <CR>"},
        {"<leader>bb", "<cmd>Telescope buffers <CR>"},
        {"gd", "<cmd>Telescope lsp_definitions <CR>"},
        {"gr", "<cmd>Telescope lsp_references <CR>"},
        {"gi", "<cmd>Telescope lsp_implementations <CR>"},
        {"<leader>ff", function()
            local dir = require("florian.utils").buffer_dir()
            vim.cmd("Telescope file_browser hidden=true grouped=true cwd_to_path=true path=" .. dir)
        end},
        {"<leader>fs", function()
            local text = vim.fn.expand("<cword>")
            vim.cmd("Telescope live_grep no_ignore=true default_text=" .. text)
        end},
        {"<leader>fs", function()
            local text = require('florian.utils').get_visual_selection()
            vim.cmd("Telescope live_grep no_ignore=true default_text=" .. text)
        end, mode="v"},
    },
}
