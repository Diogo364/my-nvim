vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_list_hide = [[.git,.jukit]]

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cmdheight = 2
vim.opt.conceallevel = 2
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.showtabline = 1
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.iskeyword:append("-")
