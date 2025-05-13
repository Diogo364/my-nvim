return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
        vim.keymap.set(
            "n",
            "<leader>gf",
            vim.lsp.buf.format,
            { desc = "Format code using LSP" }
        )

        return {
            sources = {
                require("null-ls").builtins.formatting.stylua,
                require("null-ls").builtins.formatting.black,
                require("null-ls").builtins.formatting.isort,
                require("null-ls").builtins.formatting.prettierd,
                require("null-ls").builtins.formatting.shfmt.with({
                    filetypes = { "sh", "bash", "zsh" },
                }),
            },
            degub = true,
        }
    end,
}
