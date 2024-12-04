return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    lazy = true,
    keys = require("diconfig.plugins.custom-telescope.keybindings"),
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
        { "nvim-telescope/telescope-symbols.nvim" },
    },
    config = function()
        require("diconfig.plugins.custom-telescope.setup")
        require("telescope").load_extension("ui-select")
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("live_grep_args")
    end,
}
