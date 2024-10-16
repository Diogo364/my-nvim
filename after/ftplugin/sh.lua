vim.keymap.set(
	"n",
	"<leader><leader>x",
	"<cmd>!chmod +x %<cr>",
	{ buffer = true, silent = true, desc = "Make file executable" }
)

vim.keymap.set("n", "<leader>x", function()
	if not pcall(require, "plenary") then
		error("Plenary not installed")
	end
	local fn = vim.fn.expand("%:p")

	local buf_opts = {
		readonly = true,
		modifiable = false,
		modified = false,
		ft = "markdown",
	}

	local Job = require("plenary.job")
	local cmd_out = Job:new({
		command = fn,
	}):sync()

	if cmd_out then
		table.insert(cmd_out, 1, string.format("# Run %s", fn))
		local bufnr = SendToNewScratchBuffer(cmd_out, buf_opts)
		local neww = vim.api.nvim_open_win(bufnr, false, { split = "below", height = 25, win = 0 })
		vim.api.nvim_set_current_win(neww)
	end
end, { buffer = true, desc = "Run Shell Script" })
