return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        mason_lspconfig.setup({
            --list of servers for mason to install
            ensure_installed = {
                "bashls",
                "docker_compose_language_service",
                "dockerls",
                "gopls",
                "jsonls",
                "lua_ls",
                "markdown_oxide",
                "pyright",
                "rust_analyzer",
                "tsserver",
                "html",
                "cssls",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })
        -- import mason-tool-installer
        local mason_tool_installer = require("mason-tool-installer")
        mason_tool_installer.setup({
            ensure_installed = {
                "black",
                "flake8",
                "isort",
                "pylint",
                "debugpy",
            },
        })
    end,
}
