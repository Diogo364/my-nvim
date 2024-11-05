return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Formatting
                --- Lua
                null_ls.builtins.formatting.stylua,
                --- Python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                --- Shell
                null_ls.builtins.formatting.shfmt.with({
                    filetypes = { "sh", "bash", "zsh" },
                }),
            },

            degub = true,
        })

        vim.keymap.set(
            "n",
            "<leader>gf",
            vim.lsp.buf.format,
            { desc = "Format code using LSP" }
        )
    end,
}
