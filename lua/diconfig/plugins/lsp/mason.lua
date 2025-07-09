return {
    "mason-org/mason.nvim",
    dependencies = {
        { "mason-org/mason-lspconfig.nvim", tag = "v2.0.0" },
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

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
            automatic_enable = true,
        })
    end,
}
