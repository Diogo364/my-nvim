local extensions = require("telescope").extensions
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

local find_command = {
    "fd",
}

local custom_live_grep = function(opts)
    opts = opts or {}
    -- builtin.live_grep(themes.get_dropdown(opts))
    extensions.live_grep_args.live_grep_args(themes.get_dropdown(opts))
end

local custom_grep = function(opts)
    opts = opts or {}
    builtin.grep_string(themes.get_dropdown(opts))
end

-- Project Search
vim.keymap.set("n", "<leader>pf", function()
    local find_command_copy = vim.deepcopy(find_command)
    local find_custom_variable = { "-t", "f" }

    vim.list_extend(find_command_copy, find_custom_variable)

    builtin.find_files({
        find_command = find_command_copy,
        hidden = true,
    })
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>paf", function()
    local find_command_copy = vim.deepcopy(find_command)
    local find_custom_variable = { "-t", "f" }

    vim.list_extend(find_command_copy, find_custom_variable)

    builtin.find_files({
        find_command = find_command_copy,
        hidden = true,
        no_ignore = true
    })
end, { desc = "Find files no_ignore" })

vim.keymap.set("n", "<leader>pd", function()
    local find_command_copy = vim.deepcopy(find_command)
    local find_custom_variable = { "-t", "d" }

    vim.list_extend(find_command_copy, find_custom_variable)

    builtin.find_files({
        find_command = find_command_copy,
        hidden = true,
    })
end, { desc = "Find directories" })

vim.keymap.set("n", "<leader>pad", function()
    local find_command_copy = vim.deepcopy(find_command)
    local find_custom_variable = { "-t", "d" }

    vim.list_extend(find_command_copy, find_custom_variable)

    builtin.find_files({
        find_command = find_command_copy,
        hidden = true,
        no_ignore = true
    })
end, { desc = "Find directories no_ignore" })

vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Find git files" })

vim.keymap.set("n", "<leader>pl", function()
    custom_live_grep()
end, { desc = "Live grep" })

vim.keymap.set("n", "<leader>ps", function()
    custom_grep({ search = vim.fn.input("Grep > ") })
end, { desc = "Search string with grep" })

vim.keymap.set("n", "<leader>pw", function()
    local word = vim.fn.expand("<cword>")
    custom_grep({ search = word })
end, { desc = "Grep current word" })

vim.keymap.set("n", "<leader>pW", function()
    local word = vim.fn.expand("<cWORD>")
    custom_grep({ search = word })
end, { desc = "Grep current WORD" })

-- Buffer Search
vim.keymap.set("n", "<leader>pbf", function()
    builtin.buffers({})
end, { desc = "List buffers" })

vim.keymap.set("n", "<leader>pbl", function()
    custom_live_grep({
        grep_open_files = true,
    })
end, { desc = "Live Grep in open buffers" })

vim.keymap.set("n", "<leader>pbw", function()
    local word = vim.fn.expand("<cword>")
    custom_grep({ search = word, grep_open_files = true })
end, { desc = "Grep current word" })

vim.keymap.set("n", "<leader>pbW", function()
    local word = vim.fn.expand("<cWORD>")
    custom_grep({ search = word, grep_open_files = true })
end, { desc = "Grep current WORD" })

-- Config Files Search
vim.keymap.set("n", "<leader>pcf", function()
    local find_command_copy = vim.deepcopy(find_command)
    local find_custom_variable = { "-t", "f" }

    vim.list_extend(find_command_copy, find_custom_variable)

    builtin.find_files({
        cwd = "~",
        find_command = find_command_copy,
        search_dirs = CONFIG_DIRS,
        hidden = true,
    })
end, { desc = "Find files in config directories" })

vim.keymap.set("n", "<leader>pcd", function()
    local find_command_copy = vim.deepcopy(find_command)
    local find_custom_variable = { "-t", "d" }

    vim.list_extend(find_command_copy, find_custom_variable)

    builtin.find_files({
        cwd = "~",
        find_command = find_command_copy,
        search_dirs = CONFIG_DIRS,
        hidden = true,
    })
end, { desc = "Find directories in config directories" })

vim.keymap.set("n", "<leader>pcl", function()
    custom_live_grep({
        cwd = "~",
        search_dirs = CONFIG_DIRS,
    })
end, { desc = "Live grep in config directories" })

vim.keymap.set("n", "<leader>pcs", function()
    custom_grep({
        cwd = "~",
        search_dirs = CONFIG_DIRS,
        search = vim.fn.input("Grep Config > "),
    })
end, { desc = "Grep string in config directories" })

-- Config/Settings
vim.keymap.set("n", "<leader>ph", function()
    builtin.help_tags(themes.get_ivy())
end, { desc = "Search help tags" })

vim.keymap.set("n", "<leader>pk", function()
    builtin.keymaps(themes.get_ivy())
end, { desc = "Show keymaps" })

vim.keymap.set("n", "<leader>po", function()
    builtin.colorscheme(themes.get_ivy({ enable_preview = true }))
end, { desc = "Preview colorschemes" })

vim.keymap.set("n", "<leader>pe", function()
    builtin.symbols(themes.get_dropdown({ sources = { 'emoji', 'gitmoji' } }))
end, { desc = "Preview colorschemes" })
