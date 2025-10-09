vim.opt_local.wrap = false
vim.opt_local.scrollbind = false
vim.opt_local.number = true
vim.opt_local.cursorline = true

vim.keymap.set("n", "<leader>ra", ":RainbowAlign<CR>", {
    buffer = true,
    silent = true,
    noremap = true,
    desc = "CSV: Rainbow Align",
})

vim.keymap.set("n", "<leader>rs", ":RainbowShrink<CR>", {
    buffer = true,
    silent = true,
    noremap = true,
    desc = "CSV: Rainbow Shrink",
})

vim.keymap.set("n", "<leader>rq", ":RainbowQuery<CR>", {
    buffer = true,
    silent = true,
    noremap = true,
    desc = "CSV: Rainbow Query",
})

vim.keymap.set("n", "<M-l>", ":RainbowCellGoRight<CR>", {
    buffer = true,
    silent = true,
    noremap = true,
    desc = "CSV: Go to next column",
})

vim.keymap.set("n", "<M-h>", ":RainbowCellGoLeft<CR>", {
    buffer = true,
    silent = true,
    noremap = true,
    desc = "CSV: Go to previous column",
})

