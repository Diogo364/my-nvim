return {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = true,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "echasnovski/mini.icons",
    },
    opts = {
        completions = { lsp = { enabled = true } },
        heading = {
            atx = false,
        },
    },
}
