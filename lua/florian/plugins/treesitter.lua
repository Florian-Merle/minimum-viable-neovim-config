return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    },
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter").install({
            "bash",
            "c",
            "css",
            "gitignore",
            "html",
            "http",
            "javascript",
            "json",
            "lua",
            "make",
            "markdown",
            "markdown_inline",
            "php",
            "query",
            "tmux",
            "toml",
            "twig",
            "vim",
            "vimdoc",
            "yaml",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                if vim.treesitter.get_parser(vim.api.nvim_get_current_buf()) then
                    vim.treesitter.start()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })

        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
                selection_modes = {
                    ['@function.outer'] = 'V',
                    ['@function.inner'] = 'V',
                    ['@class.outer'] = 'V',
                    ['@class.inner'] = 'V',
                    ['@conditional.inner'] = 'V',
                    ['@conditional.outer'] = 'V',
                    ['@loop.inner'] = 'V',
                    ['@loop.outer'] = 'V',
                    ['@statement.outer'] = 'V',
                },
                include_surrounding_whitespace = function(opts)
                    return opts.query_string ~= '@statement.outer'
                end,
            },
            move = {
                set_jumps = true,
            },
        })

        local select = require("nvim-treesitter-textobjects.select")
        for key, capture in pairs({
            ["aA"] = "@attribute.outer",
            ["iA"] = "@attribute.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ia"] = "@parameter.inner",
            ["aa"] = "@parameter.outer",
            ["ax"] = "@comment.outer",
            ["iC"] = "@conditional.inner",
            ["aC"] = "@conditional.outer",
            ["iL"] = "@loop.inner",
            ["aL"] = "@loop.outer",
            ["is"] = "@statement.outer",
        }) do
            vim.keymap.set({ "x", "o" }, key, function()
                select.select_textobject(capture, "textobjects")
            end)
        end

        local move = require("nvim-treesitter-textobjects.move")
        vim.keymap.set({ "n", "x", "o" }, "]]", function()
            move.goto_next_start("@class.outer", "textobjects")
        end)
        vim.keymap.set({ "n", "x", "o" }, "[[", function()
            move.goto_previous_start("@class.outer", "textobjects")
        end)
    end
}
