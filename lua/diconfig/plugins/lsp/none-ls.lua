return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
			},
			degub = true,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format code using LSP" })
	end,
}
