vim.keymap.set(
    { "n", "v" },
    "<leader>cca",
    "<cmd>CodeCompanionActions<cr>",
    { noremap = true, silent = true }
)
vim.keymap.set(
    { "n", "v" },
    "<leader>ccomp",
    "<cmd>CodeCompanionChat Toggle<cr>",
    { noremap = true, silent = true }
)
vim.keymap.set(
    "v",
    "ga",
    "<cmd>CodeCompanionChat Add<cr>",
    { noremap = true, silent = true }
)

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
return {}
