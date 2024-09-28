return {
    "goolord/alpha-nvim",
    dependencies = {
        "echasnovski/mini.icons",
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local startify = require("alpha.themes.startify")
        require("alpha").setup(startify.opts)
    end,
}
