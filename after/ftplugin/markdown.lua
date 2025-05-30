-- Markdown specific settings
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.wrap = true -- Wrap text
vim.opt_local.breakindent = true -- Match indent on line break
vim.opt_local.linebreak = true -- Line break on whole words

-- Allow j/k when navigating wrapped lines
vim.keymap.set({ "n", "v" }, "j", "gj", { buffer = 0 })
vim.keymap.set({ "n", "v" }, "k", "gk", { buffer = 0 })
vim.keymap.set({ "n", "v" }, "0", "g0", { buffer = 0 })
vim.keymap.set({ "n", "v" }, "^", "g^", { buffer = 0 })
vim.keymap.set({ "n", "v" }, "_", "g_", { buffer = 0 })
vim.keymap.set({ "n", "v" }, "$", "g$", { buffer = 0 })

-- Spell check
vim.opt_local.spelllang = { "pt_br", "en_us" }
vim.opt_local.spell = true
