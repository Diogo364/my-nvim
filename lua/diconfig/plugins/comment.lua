return {
    "numToStr/Comment.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = function(_, opts)
        vim.keymap.set(
            "n",
            "gy",
            '"pyy<cmd>lua require("Comment.api").toggle.linewise()<cr>"pp',
            { desc = "Duplicate and comment out line" }
        )

        vim.keymap.set(
            "v",
            "gy",
            '"pygv<cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr><Esc>"pp',
            { desc = "Duplicate and comment out line" }
        )

        return opts
    end,
}
