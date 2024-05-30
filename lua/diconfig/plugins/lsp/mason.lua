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
            opts = {
                ensure_installed = {
                    "mypy",
                    "ruff",
                },
            },
        })
        mason_lspconfig.setup({
            --list of servers for mason to install
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "pyright",
                "jsonls",
                "bashls",
                "gopls",
                "dockerls",
                "docker_compose_language_service",
                "ltex",
                "markdown_oxide",
                "yamlls",
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
                "mypy",
                "ruff",
                "pylint",
                "debugpy",
            },
        })
    end,
}
