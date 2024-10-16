local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")
local actions_layout = require("telescope.actions.layout")
local custom = require("diconfig.plugins.custom-telescope.custom-functions")

M = {}

M.find_files = {
    i = {
        ["<C-S-y>"] = function()
            custom.yank_entry({ relative_path = false })
        end,

        ["<C-y>"] = function()
            custom.yank_entry({ relative_path = true })
        end,

        ["<Tab>"] = custom.focus_preview,

        ["<M-v>"] = actions_layout.toggle_preview,
    },
    n = {
        ["<M-v>"] = actions_layout.toggle_preview,

        ["<Tab>"] = custom.focus_preview,

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
            custom.yank_entry({ relative_path = false })
        end,

        ["<C-y>"] = function()
            custom.yank_entry({ relative_path = true })
        end,
        ["<leader><CR>"] = custom.system_open_file,

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
        ["<Tab>"] = custom.focus_preview,

        ["<M-v>"] = actions_layout.toggle_preview,
    },
    n = {
        ["<Tab>"] = custom.focus_preview,

        ["v"] = actions.toggle_selection,

        ["<M-v>"] = actions_layout.toggle_preview,
    },
}

M.live_grep_args = {
    i = {
        ["<C-K>"] = lga_actions.quote_prompt(),

        ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),

        ["<C-space>"] = actions.to_fuzzy_refine,
    },
}

M.live_grep = {
    i = {
        ["<Tab>"] = custom.focus_preview,

        ["<M-v>"] = actions_layout.toggle_preview,
    },
    n = {
        ["<Tab>"] = custom.focus_preview,

        ["v"] = actions.toggle_selection,

        ["<M-v>"] = actions_layout.toggle_preview,
    },
}

M.buffers = {
    i = {
        ["<Tab>"] = custom.focus_preview,

        ["<M-v>"] = actions_layout.toggle_preview,
    },
    n = {
        ["<Tab>"] = custom.focus_preview,

        ["v"] = actions.toggle_selection,

        ["<M-v>"] = actions_layout.toggle_preview,

        ["<C-d>"] = function(prompt_bufnr)
            local entry = require("telescope.actions.state").get_selected_entry()
            local entry_path = entry.path

            close_matched_buffers({
                compare_func = function(bufnr)
                    return is_specific_buffer(bufnr, entry_path)
                end,
            })
        end,
    },
}

return M
