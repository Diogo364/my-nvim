return {
    "luk400/vim-jukit",
    ft = { "py" },
    config = function() 
        vim.keymap.set("n", "<leader><cr>", ":call jukit#send#section(0)<cr>")
    end
}
