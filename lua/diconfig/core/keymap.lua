vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Navigate vim panes better
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>%", ':let @" = expand("%")<cr>')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Create mark before major movements
vim.keymap.set("n", "gg", "m0gg")
vim.keymap.set("n", "G", "m0G")
vim.keymap.set("n", "<C-U>", "m0<C-U>")
vim.keymap.set("n", "<C-D>", "m0<C-D>")

-- Select entire content of the file
vim.keymap.set("n", "<leader><leader>a", "m0gg<S-v>G")

-- Simple exit from terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Resize splits
vim.keymap.set("n", "<M-=>", "<C-W>=")
-- Vertical
vim.keymap.set("n", "<M-+>", "<C-W>2+")
vim.keymap.set("n", "<M-->", "<C-W>2-")
-- Horizontal
vim.keymap.set("n", "<M->>", "<C-W>5>")
vim.keymap.set("n", "<M-<>", "<C-W>5<")

-- Source config
vim.keymap.set("n", "<leader><leader>x", ":source %<CR>")

vim.keymap.set("n", "<leader>sh", ":split<CR>")
vim.keymap.set("n", "<leader>sv", ":vs<CR>")

-- Create terminal split at bottom of screen
vim.keymap.set("n", "<M-t>", ":bot :term<CR>")

-- Moving splits with motions
vim.keymap.set("n", "<leader>msh", "<C-w>H")
vim.keymap.set("n", "<leader>msj", "<C-w>J")
vim.keymap.set("n", "<leader>msk", "<C-w>K")
vim.keymap.set("n", "<leader>msl", "<C-w>L")
