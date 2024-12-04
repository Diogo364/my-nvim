local find_command = {
    "fd",
}

local custom_live_grep = function(opts)
    opts = opts or {}
    require("telescope").extensions.live_grep_args.live_grep_args(
        require("telescope.themes").get_dropdown(opts)
    )
end

local custom_grep = function(opts)
    opts = opts or {}
    require("telescope.builtin").grep_string(
        require("telescope.themes").get_dropdown(opts)
    )
end

-- Project Search
return {
    {
        "<leader>pf",
        function()
            local find_command_copy = vim.deepcopy(find_command)
            local find_custom_variable = { "-t", "f" }

            vim.list_extend(find_command_copy, find_custom_variable)

            require("telescope.builtin").find_files({
                find_command = find_command_copy,
                path_display = { "truncate" },
                hidden = true,
            })
        end,
        desc = "Find files",
    },
    {
        "<leader>pl",
        function()
            custom_live_grep({
                grep_open_files = true,
            })
        end,
        desc = "Live Grep in current project",
    },
    {
        "<leader>paf",
        function()
            local find_command_copy = vim.deepcopy(find_command)
            local find_custom_variable = { "-t", "f" }

            vim.list_extend(find_command_copy, find_custom_variable)

            require("telescope.builtin").find_files({
                path_display = { "truncate" },
                find_command = find_command_copy,
                hidden = true,
                no_ignore = true,
            })
        end,
        desc = "Find files no_ignore",
    },

    {
        "<leader>pd",
        function()
            local find_command_copy = vim.deepcopy(find_command)
            local find_custom_variable = { "-t", "d" }

            vim.list_extend(find_command_copy, find_custom_variable)

            require("telescope.builtin").find_files({
                path_display = { "truncate" },
                find_command = find_command_copy,
                hidden = true,
            })
        end,
        desc = "Find directories",
    },

    {
        "<leader>pad",
        function()
            local find_command_copy = vim.deepcopy(find_command)
            local find_custom_variable = { "-t", "d" }

            vim.list_extend(find_command_copy, find_custom_variable)

            require("telescope.builtin").find_files({
                path_display = { "truncate" },
                find_command = find_command_copy,
                hidden = true,
                no_ignore = true,
            })
        end,
        desc = "Find directories no_ignore",
    },

    {
        "<leader>pg",
        require("telescope.builtin").git_files,
        desc = "Find git files",
    },

    {
        "<leader>ps",
        function()
            custom_grep({ search = vim.fn.input("Grep > ") })
        end,
        desc = "Search string with grep",
    },

    {
        "<leader>pw",
        function()
            local word = vim.fn.expand("<cword>")
            custom_grep({ search = word })
        end,
        desc = "Grep current word",
    },

    {
        "<leader>pW",
        function()
            local word = vim.fn.expand("<cWORD>")
            custom_grep({ search = word })
        end,
        desc = "Grep current WORD",
    },

    -- Buffer Search
    {
        "<leader>pbf",
        function()
            require("telescope.builtin").buffers({})
        end,
        desc = "List buffers",
    },

    {
        "<leader>pbl",
        function()
            custom_live_grep({
                grep_open_files = true,
            })
        end,
        desc = "Live Grep in open buffers",
    },

    {
        "<leader>pbw",
        function()
            local word = vim.fn.expand("<cword>")
            custom_grep({ search = word, grep_open_files = true })
        end,
        desc = "Grep current word",
    },

    {
        "<leader>pbW",
        function()
            local word = vim.fn.expand("<cWORD>")
            custom_grep({ search = word, grep_open_files = true })
        end,
        desc = "Grep current WORD",
    },

    -- Config Files Search
    {
        "<leader>pcf",
        function()
            local find_command_copy = vim.deepcopy(find_command)
            local find_custom_variable = { "-t", "f" }

            vim.list_extend(find_command_copy, find_custom_variable)

            require("telescope.builtin").find_files({
                path_display = { "truncate" },
                cwd = "~",
                find_command = find_command_copy,
                search_dirs = CONFIG_DIRS,
                hidden = true,
            })
        end,
        desc = "Find files in config directories",
    },

    {
        "<leader>pcd",
        function()
            local find_command_copy = vim.deepcopy(find_command)
            local find_custom_variable = { "-t", "d" }

            vim.list_extend(find_command_copy, find_custom_variable)

            require("telescope.builtin").find_files({
                path_display = { "truncate" },
                cwd = "~",
                find_command = find_command_copy,
                search_dirs = CONFIG_DIRS,
                hidden = true,
            })
        end,
        desc = "Find directories in config directories",
    },

    {
        "<leader>pcl",
        function()
            custom_live_grep({
                cwd = "~",
                search_dirs = CONFIG_DIRS,
            })
        end,
        desc = "Live grep in config directories",
    },

    {
        "<leader>pcs",
        function()
            custom_grep({
                cwd = "~",
                search_dirs = CONFIG_DIRS,
                search = vim.fn.input("Grep Config > "),
            })
        end,
        desc = "Grep string in config directories",
    },

    -- Config/Settings
    {
        "<leader>ph",
        function()
            require("telescope.builtin").help_tags(
                require("telescope.themes").get_ivy()
            )
        end,
        desc = "Search help tags",
    },

    {
        "<leader>pk",
        function()
            require("telescope.builtin").keymaps(
                require("telescope.themes").get_ivy()
            )
        end,
        desc = "Show keymaps",
    },

    {
        "<leader>po",
        function()
            require("telescope.builtin").colorscheme(
                require("telescope.themes").get_ivy({ enable_preview = true })
            )
        end,
        desc = "Preview colorschemes",
    },

    {
        "<leader>pe",
        function()
            require("telescope.builtin").symbols(
                require("telescope.themes").get_dropdown({
                    sources = { "emoji", "gitmoji" },
                })
            )
        end,
        desc = "Preview colorschemes",
    },
}
