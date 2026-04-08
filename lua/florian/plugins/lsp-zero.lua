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
        require('lspconfig').phpactor.setup{}

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
