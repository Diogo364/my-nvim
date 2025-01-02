vim.keymap.set(
    "n",
    "<leader>x",
    "<CMD>w<CR><CMD>.lua<CR>",
    { buffer = true, silent = true, desc = "Source current line" }
)

vim.keymap.set(
    "v",
    "<leader>x",
    ":lua<CR>",
    { buffer = true, silent = true, desc = "Run Selected Lines" }
)

vim.keymap.set(
    "n",
    "<leader><leader>x",
    "<CMD>w<CR><CMD>source %<CR>",
    { buffer = true, silent = true, desc = "Source current lua file" }
)

vim.keymap.set(
    "n",
    "<leader><leader>t",
    "<CMD>w<CR><Plug>PlenaryTestFile<CR>",
    { buffer = true, desc = "Run Plenary test on current file" }
)
