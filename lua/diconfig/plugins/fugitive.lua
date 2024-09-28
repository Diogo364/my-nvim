return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Git status window" })
        vim.keymap.set("n", "<leader>gdiff", ":Git diff<CR>", { desc = "Show Git diff" })
        vim.keymap.set("n", "<leader>glog", ":Git log<CR>", { desc = "Show Git log" })
    end,
}
