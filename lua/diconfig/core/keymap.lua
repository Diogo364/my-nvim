vim.g.mapleader = " " -- Set space as the leader key

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

-- Navigate vim panes better
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Move to pane above" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Move to pane below" })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Move to left pane" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Move to right pane" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line without moving cursor" })
vim.keymap.set({ "n", "v" }, "<c-d>", "<c-d>zz", { desc = "scroll down and center" })
vim.keymap.set({ "n", "v" }, "<c-u>", "<c-u>zz", { desc = "scroll up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank selected to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

vim.keymap.set("n", "<leader>%", ':let @+ = expand("%:.")<cr>', { desc = "Copy relative file path" })
vim.keymap.set("n", "<leader><leader>%", ':let @+ = expand("%:p")<cr>', { desc = "Copy absolute file path" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without overwriting register" })
vim.keymap.set("v", "<leader>c", '"_di', { desc = "Delete without yanking and enter insert mode" })
vim.keymap.set("n", "<leader>cc", '"_ddO', { desc = "Delete without yanking and enter insert mode" })
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete selection without yanking" })

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })

vim.keymap.set("n", "Q", "<cmd>silent !tmux neww qconf nvim<CR>", { desc = "Open a new tmux window" })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer" })

vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end, { desc = "Format current buffer with LSP" })

vim.keymap.set(
    "n",
    "<leader>s",
    ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
    { desc = "Replace word under cursor" }
)
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Create mark before major movements
vim.keymap.set("n", "gg", "m0gg", { desc = "Mark and go to top of file" })
vim.keymap.set("n", "G", "m0G", { desc = "Mark and go to bottom of file" })
vim.keymap.set("n", "<C-U>", "m0<C-U>", { desc = "Mark and scroll up half-page" })
vim.keymap.set("n", "<C-D>", "m0<C-D>", { desc = "Mark and scroll down half-page" })

-- Select entire content of the file
vim.keymap.set("n", "<leader><leader>a", "m0gg<S-v>G", { desc = "Select all content of the file" })

-- Simple exit from terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Resize splits
vim.keymap.set("n", "<M-f>", "<C-W>_ <C-W>|", { desc = "Maximize split" })
vim.keymap.set("n", "<M-=>", "<C-W>=", { desc = "Equalize split sizes" })
-- Vertical resizing
vim.keymap.set("n", "<M-+>", "<C-W>2+", { desc = "Increase split height" })
vim.keymap.set("n", "<M-->", "<C-W>2-", { desc = "Decrease split height" })
-- Horizontal resizing
vim.keymap.set("n", "<M->>", "<C-W>5>", { desc = "Increase split width" })
vim.keymap.set("n", "<M-<>", "<C-W>5<", { desc = "Decrease split width" })

-- Source config
vim.keymap.set("n", "<leader>x", ":w<CR> :source %<CR>", { desc = "Save and source file" })
vim.keymap.set("v", "<leader>x", RunLuaLine, { desc = "Run Lua code" })

vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>sv", ":vs<CR>", { desc = "Vertical split" })

-- Create terminal split at bottom of screen
vim.keymap.set("n", "<M-t>", ":bot :term<CR>", { desc = "Open terminal at bottom" })
vim.keymap.set("n", "<M-v>", " :term<CR>", { desc = "Open terminal in vertical split" })

-- Moving splits with motions
vim.keymap.set("n", "<leader>msh", "<C-w>H", { desc = "Move split left" })
vim.keymap.set("n", "<leader>msj", "<C-w>J", { desc = "Move split down" })
vim.keymap.set("n", "<leader>msk", "<C-w>K", { desc = "Move split up" })
vim.keymap.set("n", "<leader>msl", "<C-w>L", { desc = "Move split right" })

vim.keymap.set({ "n", "v" }, "/", "/\\v", { noremap = true, desc = "Enable very magic search" })
vim.keymap.set({ "n", "v" }, "?", "?\\v", { noremap = true, desc = "Enable very magic reverse search" })
