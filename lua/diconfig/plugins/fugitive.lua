return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gdiff", ":Git diff<CR>")
        vim.keymap.set("n", "<leader>glog",  ":Git log<CR>")
    end
}
