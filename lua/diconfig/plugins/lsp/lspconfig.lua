return {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        { "nvim-telescope/telescope.nvim" },
    },
    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local on_attach = function(client, bufnr)
            vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", {
                desc = "Show LSP references",
                buffer = bufnr,
                noremap = true,
                silent = true,
            })
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
                desc = "Go to declaration",
                buffer = bufnr,
                noremap = true,
                silent = true,
            })
            vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", {
                desc = "Show LSP definition",
                buffer = bufnr,
                noremap = true,
                silent = true,
            })
            vim.keymap.set(
                "n",
                "gi",
                "<cmd>Telescope lsp_implementations<CR>",
                {
                    desc = "Show LSP implementation",
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                }
            )
            vim.keymap.set(
                "n",
                "gt",
                "<cmd>Telescope lsp_type_definitions<CR>",
                {
                    desc = "Show LSP type definitions",
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                }
            )
            vim.keymap.set(
                { "n", "v" },
                "<leader>ca",
                vim.lsp.buf.code_action,
                {
                    desc = "See available code actions",
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                }
            )
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
                desc = "Smart rename",
                buffer = bufnr,
                noremap = true,
                silent = true,
            })
            vim.keymap.set(
                "n",
                "<leader>D",
                "<cmd>Telescope diagnostics bufnr=0<CR>",
                {
                    desc = "Show buffer diagnostic",
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                }
            )
            -- vim.keymap.set(
            -- 	"n",
            -- 	"<leader>D",
            -- 	vim.diagnostic.open_float,
            -- 	{ desc = "Show line diagnostic", buffer = bufnr, noremap = true, silent = true }
            -- )
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
                desc = "Go to previous diagnostic",
                buffer = bufnr,
                noremap = true,
                silent = true,
            })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
                desc = "Go to next diagnostic",
                buffer = bufnr,
                noremap = true,
                silent = true,
            })
            vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {
                desc = "Show documentation for what is under cursor",
                buffer = bufnr,
                noremap = true,
                silent = true,
            })
            vim.keymap.set("i", "<M-k>", vim.lsp.buf.completion, {
                desc = "Show documentation for what is under cursor",
                buffer = bufnr,
                noremap = true,
                silent = true,
            })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {
                desc = "Show documentation for what is under cursor",
                buffer = bufnr,
                noremap = true,
                silent = true,
            })
            vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", {
                desc = "Restart LSP",
                buffer = bufnr,
                noremap = true,
                silent = true,
            })
            vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, {
                desc = "Signature Help",
                buffer = bufnr,
                noremap = true,
                silent = true,
            })
        end
        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs =
            { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- configure html server

        lspconfig["bashls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = {
                "zsh",
                "bash",
                "sh",
            },
        })

        lspconfig["docker_compose_language_service"].setup({
            filetypes = {
                "yaml.docker-compose",
                "yaml",
            },
        })

        lspconfig["dockerls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["gopls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["jsonls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["lua_ls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        vim.uv.fs_stat(path .. "/.luarc.json")
                        or vim.uv.fs_stat(path .. "/.luarc.jsonc")
                    then
                        return
                    end
                end

                client.config.settings.Lua =
                    vim.tbl_deep_extend("force", client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = "LuaJIT",
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                                vim.fn.stdpath("config"),
                            },
                        },
                    })
            end,
            settings = {
                Lua = {
                    runtime = { version = "Lua 5.1" },
                    diagnostics = {
                        globals = {
                            "bit",
                            "vim",
                            "it",
                            "describe",
                            "before_each",
                            "after_each",
                        },
                    },
                },
            },
        })

        lspconfig["markdown_oxide"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "python" },
            settings = {
                pyright = {
                    disableOrganizeImports = true,
                },
            },
        })

        lspconfig["rust_analyzer"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                logLevel = "debug",
            },
        })

        lspconfig["html"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["zls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
}
