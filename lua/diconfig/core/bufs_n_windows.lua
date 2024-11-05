vim.keymap.set(
    "n",
    "<leader>bn",
    "<CMD>ene<CR><CMD>set ft=lua<CR>",
    { desc = "Create new lua unnamed buffer" }
)

vim.keymap.set("n", "]t", "<CMD>tabn<CR>", { desc = "Open next tab" })
vim.keymap.set("n", "[t", "<CMD>tabp<CR>", { desc = "Open previous tab" })
vim.keymap.set(
    "n",
    "<leader>tn",
    "<CMD>tab split<CR>",
    { desc = "Create new tab" }
)
