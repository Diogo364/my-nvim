return {
	"luk400/vim-jukit",
	init = function()
		-- Jukit Global Config
		vim.g.jukit_mappings = 0
		vim.g.jukit_layout = {
			p1 = 0.65,
			split = "vertical",
			val = {
				"file_content",
				{
					split = "horizontal",
					p1 = 0.6,
					val = { "output", "output_history" },
				},
			},
		}
	end,
}
