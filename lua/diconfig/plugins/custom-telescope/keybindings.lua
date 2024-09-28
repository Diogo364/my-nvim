local builtin = require("telescope.builtin")

-- Project Search
vim.keymap.set("n", "<leader>pf", function()
	builtin.find_files({
		hidden = true,
	})
end)

vim.keymap.set("n", "<leader>pg", builtin.git_files)

vim.keymap.set("n", "<leader>pl", function()
	builtin.live_grep({})
end)

vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set("n", "<leader>pw", function()
	local word = vim.fn.expand("<cword>")
	builtin.grep_string({ search = word })
end)

vim.keymap.set("n", "<leader>pW", function()
	local word = vim.fn.expand("<cWORD>")
	builtin.grep_string({ search = word })
end)

-- Buffer Search
vim.keymap.set("n", "<leader>pbf", function()
	builtin.buffers({})
end)

vim.keymap.set("n", "<leader>pbl", function()
	builtin.live_grep({
		grep_open_files = true,
	})
end)

vim.keymap.set("n", "<leader>pbw", function()
	local word = vim.fn.expand("<cword>")
	builtin.grep_string({ search = word, grep_open_files = true })
end)

vim.keymap.set("n", "<leader>pbW", function()
	local word = vim.fn.expand("<cWORD>")
	builtin.grep_string({ search = word, grep_open_files = true })
end)

-- Config Files Search
vim.keymap.set("n", "<leader>pcf", function()
	builtin.find_files({
		cwd = "~",
		search_dirs = CONFIG_DIRS,
		hidden = true,
	})
end)

vim.keymap.set("n", "<leader>pcl", function()
	builtin.live_grep({
		cwd = "~",
		search_dirs = CONFIG_DIRS,
	})
end)

vim.keymap.set("n", "<leader>pcs", function()
	builtin.grep_string({
		cwd = "~",
		search_dirs = CONFIG_DIRS,
		search = vim.fn.input("Grep Config > "),
	})
end)

-- Config/Settings
vim.keymap.set("n", "<leader>ph", builtin.help_tags)

vim.keymap.set("n", "<leader>pk", builtin.keymaps)

vim.keymap.set("n", "<leader>pau", builtin.autocommands)

vim.keymap.set("n", "<leader>po", function()
	builtin.colorscheme({ enable_preview = true })
end)
