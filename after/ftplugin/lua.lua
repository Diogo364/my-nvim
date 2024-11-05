vim.keymap.set(
    "n",
    "<leader>x",
    "<CMD>w<CR><CMD>source %<CR>",
    { buffer = true, silent = true, desc = "Source current lua file" }
)

vim.keymap.set(
    "n",
    "<leader><space>t",
    "<CMD>w<CR><Plug>PlenaryTestFile<CR>",
    { buffer = true, desc = "Run Plenary test on current file" }
)
