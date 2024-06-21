return {
    "luk400/vim-jukit",
    ft = { "python" },
    config = function()
        vim.keymap.set("n", "<leader><cr>", ":call jukit#send#section(0)<cr>")
        vim.keymap.set("n", "<Nop>", ":call jukit#send#line()<cr>")
        vim.keymap.set("n", "<Nop>", ":call jukit#splits#out_hist_scroll(0)<cr>")
    end
}
