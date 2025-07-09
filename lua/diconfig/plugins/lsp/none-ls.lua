return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
        local null_ls = require("null-ls")

        return {
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.shfmt.with({
                    filetypes = { "sh", "bash", "zsh" },
                }),
                null_ls.builtins.formatting.sqlfluff.with({
                    extra_args = { "--dialect", "duckdb" },
                }),
            },
            degub = true,
        }
    end,
}
