return {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        "*",
    },
}
