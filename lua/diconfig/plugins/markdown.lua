return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        enabled = true,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "echasnovski/mini.nvim",
        },
        ft = { "markdown", "codecompanion" },
        opts = {
            completions = { blink = { enabled = true } },
            heading = {
                enabled = false,
                left_pad = 2,
            },
            bullet = {
                left_pad = 2,
            },
            pipe_table = {
                preset = "round",
            },
        },
    },
}
