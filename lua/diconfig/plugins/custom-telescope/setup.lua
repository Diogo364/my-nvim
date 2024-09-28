local custom_mappings = require("diconfig.plugins.custom-telescope.custom-mappings")
local buffer_previewer_maker = require("diconfig.plugins.custom-telescope.custom-functions").buffer_previewer_maker

M = {
	defaults = {
		-- path_display = { "smart" },
		-- file_ignore_patterns = AlwaysHidePattern,

		preview = {
			filesize_limit = 0.5, -- MB
			buffer_previewer_maker = buffer_previewer_maker,
		},

		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob",
			"!**/.git/*",
		},

		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.5,
			},
			width = 0.8,
			height = 0.8,
			preview_cutoff = 120,
		},
	},

	pickers = {
		find_files = {
			mappings = custom_mappings.find_files,
			find_command = {
				"fd",
				"--ignore-file",
				"~/.config/fd/ignore",
			},

			live_grep = {
				mappings = custom_mappings.live_grep,
				additional_args = {
					"--hidden",
				},
			},

			buffers = {
				mappings = custom_mappings.buffers,
			},

			lsp_references = {
				mappings = custom_mappings.lsp_references,
			},
		},
	},
}

require("telescope").setup(M)
require("diconfig.plugins.custom-telescope.keybindings")
