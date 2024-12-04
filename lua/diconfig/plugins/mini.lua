return {
    "echasnovski/mini.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            after = "nvim-treesitter",
            requires = "nvim-treesitter/nvim-treesitter",
        },
    },
    version = false,
    config = function()
        require("diconfig.plugins.mini-extensions.setup")
    end,
}
