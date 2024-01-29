return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {"hrsh7th/cmp-nvim-lsp-signature-help"},
        {"hrsh7th/cmp-buffer"},
        {"hrsh7th/cmp-cmdline"},
        {"onsails/lspkind.nvim"},
    },
    event = { "BufEnter" },
    config = function()
        local lsp = require('lsp-zero').preset({})

        lsp.on_attach(function(_, bufnr)
            lsp.default_keymaps({buffer = bufnr})
        end)

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        require('lspconfig').phpactor.setup({
            require("cmp_nvim_lsp").default_capabilities()
        })

        lsp.setup()

        local cmp = require("cmp")
        local cmp_action = require('lsp-zero').cmp_action()
        local lspkind = require("lspkind")

        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "buffer" },
            },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                },
                ['<Tab>'] = cmp_action.tab_complete(),
                ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
            }),
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[Lua]",
                    })
                }),
            },
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                    { name = "cmdline" }
                }),
        })
    end,
    keys = {
        {"<leader>ca", function()
            vim.lsp.buf.code_action()
        end},
        {"<leader>ca", function()
            vim.lsp.buf.code_action()
        end, mode="v"},
        {"K", function()
            vim.lsp.buf.hover()
        end},
    },
}
