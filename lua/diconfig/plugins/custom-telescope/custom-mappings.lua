local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")
local custom_functions = require("diconfig.plugins.custom-telescope.custom-functions")

M = {}

M.find_files = {
	i = {
		["<C-S-y>"] = function()
			custom_functions.yank_entry({ relative_path = false })
		end,

		["<C-y>"] = function()
			custom_functions.yank_entry({ relative_path = true })
		end,

		["<Tab>"] = custom_functions.focus_preview,

		["<C-p>"] = actions_layout.toggle_preview,
	},
	n = {
		["<C-p>"] = actions_layout.toggle_preview,

		["<Tab>"] = custom_functions.focus_preview,

		["v"] = actions.toggle_selection,

		["to"] = function(prompt_bufnr)
			local entry = require("telescope.actions.state").get_selected_entry()
			require("telescope.actions").close(prompt_bufnr)
			vim.cmd(string.format(":!tmux neww nvim %s", entry.path))
		end,

		["ts"] = function(prompt_bufnr)
			local entry = require("telescope.actions.state").get_selected_entry()
			require("telescope.actions").close(prompt_bufnr)
			vim.cmd(string.format(":!tmux splitw -h nvim %s", entry.path))
		end,

		["cd"] = function(prompt_bufnr)
			local selection = require("telescope.actions.state").get_selected_entry()
			local dir = vim.fn.fnamemodify(selection.path, ":p:h")
			require("telescope.actions").close(prompt_bufnr)
			-- Depending on what you want put `cd`, `lcd`, `tcd`
			vim.cmd(string.format("silent cd %s", dir))
		end,

		["<C-S-y>"] = function()
			custom_functions.yank_entry({ relative_path = false })
		end,

		["<C-y>"] = function()
			custom_functions.yank_entry({ relative_path = true })
		end,
		["<leader><CR>"] = custom_functions.system_open_file,

		["fd"] = function(prompt_bufnr)
			local entry = require("telescope.actions.state").get_selected_entry()
			local entry_path = entry.path

			if vim.fn.input(string.format("Delete %s [y/n]: ", entry_path)) == "y" then
				close_matched_buffers({
					compare_func = function(bufnr)
						return is_specific_buffer(bufnr, entry_path)
					end,
				})
				os.remove(entry_path)
				print("Deleted ", entry_path)
			else
				print("Canceled")
			end
		end,
	},
}
M.lsp_references = {
	i = {
		["<Tab>"] = custom_functions.focus_preview,

		["<C-p>"] = actions_layout.toggle_preview,
	},
	n = {
		["<Tab>"] = custom_functions.focus_preview,

		["v"] = actions.toggle_selection,

		["<C-p>"] = actions_layout.toggle_preview,
	},
}

M.live_grep = {
	i = {
		["<Tab>"] = custom_functions.focus_preview,

		["<C-p>"] = actions_layout.toggle_preview,
	},
	n = {
		["<Tab>"] = custom_functions.focus_preview,

		["v"] = actions.toggle_selection,

		["<C-p>"] = actions_layout.toggle_preview,
	},
}

M.buffers = {
	i = {
		["<Tab>"] = custom_functions.focus_preview,

		["<C-p>"] = actions_layout.toggle_preview,
	},
	n = {
		["<C-d>"] = require("telescope.actions").delete_buffer,

		["<Tab>"] = custom_functions.focus_preview,

		["v"] = actions.toggle_selection,

		["<C-p>"] = actions_layout.toggle_preview,
	},
}

return M
