return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
    },
    event = { "BufEnter" },
    config = function()
        local lsp = require('lsp-zero').preset({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "eslint",
                "html",
                "cssls",
                "yamlls",
                "jsonls",
                "dockerls",
            },
            handlers = {
                lsp.default_setup,
            },
        })

        lsp.on_attach(function(_, bufnr)
            lsp.default_keymaps({buffer = bufnr})
        end)

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        require('lspconfig').phpactor.setup({
            init_options = {
                ['language_server_php_cs_fixer.enabled'] = false,
                ['language_server_worse_reflection.inlay_hints.enable'] = true,
                ['language_server_worse_reflection.inlay_hints.params'] = true,
                ['language_server_worse_reflection.inlay_hints.types'] = true,
                ['language_server_completion.trim_leading_dollar'] = true,
            },
        })

        lsp.setup()
    end,
    keys = {
        {"<leader>ca", function()
            vim.lsp.buf.code_action()
        end},
        {"<leader>ca", function()
            vim.lsp.buf.code_action()
        end, mode="v"},
    },
}
