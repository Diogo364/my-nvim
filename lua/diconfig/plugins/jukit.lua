return {
    "luk400/vim-jukit",

    config = function() 
        vim.keymap.set("n", "<leader><cr>", ":call jukit#send#section(0)<cr>")
    end
}
