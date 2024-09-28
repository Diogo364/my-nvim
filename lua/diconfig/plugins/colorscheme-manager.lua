return {
	-- dir = "/home/dinascimento/Documents/myProjects/custom_nvim_lua_plugs/colorscheme_telescope.nvim",
	-- name = "colorscheme-manager",
	"Diogo364/colorscheme-manager.nvim",
	tag = "beta",
	config = function()
		local ColorMyPencils = function()
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end

		require("colorscheme-manager").setup({
			colorscheme = "tokyonight-night",
			enable_custom_options = true,
			custom_options_function = ColorMyPencils,
		})
	end,
}
