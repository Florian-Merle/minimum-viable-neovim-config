return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        {"nvim-tree/nvim-web-devicons"},
    },
    cmd = { "NvimTreeToggle"},
    keys = {
        {"<C-n>", "<cmd> NvimTreeToggle <CR>"},
        {"<leader>rf", "<cmd> NvimTreeFindFile <CR>"},
        {"<leader>rc", "<cmd> NvimTreeCollapse <CR>"},
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            view = {
                adaptive_size = true
            },
            update_focused_file = {
                enable = false
            },
            git = {
                enable = true,
                ignore = false,
            },
            renderer = {
                highlight_git = true,
                icons = {
                    show = {
                        git = true,
                    },
                },
            },
            on_attach = function (bufnr)
                local api = require "nvim-tree.api"
                local lib = require "nvim-tree.lib"

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                local get_target_dir = function()
                    local node = lib.get_node_at_cursor()
                    if not node then
                        return nil
                    end

                    local cwd = node.cwd or node.link_to or node.absolute_path
                    if vim.fn.isdirectory(cwd) ~= 0 == true then
                        return cwd
                    end

                    return node.parent.cwd or node.parent.link_to or node.parent.absolute_path
                end

                -- default mappings
                api.config.mappings.default_on_attach(bufnr)

                -- custom mappings
                vim.keymap.set(
                    'n',
                    '<leader>fd',
                    function ()
                        local cwd = get_target_dir()
                        if nil == cwd then
                            return
                        end

                        vim.cmd('Telescope find_files no_ignore=true cwd=' .. cwd)
                    end,
                    opts('Find files in directory')
                )
                vim.keymap.set(
                    'n',
                    '<leader>fg',
                    function ()
                        local cwd = get_target_dir()
                        if nil == cwd then
                            return
                        end

                        vim.cmd('Telescope live_grep no_ignore=true cwd=' .. cwd)
                    end,
                    opts('Find files in directory')
                )
            end,
        })
    end,
}
