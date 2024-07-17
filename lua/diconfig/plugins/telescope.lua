return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.6",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("telescope").setup({
            defaults = {
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
            },
            pickers = {
                find_files = {
                    find_command = {
                        "fd",
                        '--exclude="**/.git/*"',
                        "--hidden",
                    },
                },
                live_grep = {
                    additional_args = {
                        "--hidden",
                    },
                },
            },
        })

        local CONFIG_DIRS = { ".config", ".dotfiles" }
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})

        -- Search for files in config locations
        vim.keymap.set("n", "<leader>pcf", function()
            builtin.find_files({
                cwd = "~",
                search_dirs = CONFIG_DIRS,
                hidden = false,
            })
        end)

        vim.keymap.set("n", "<leader>pcs", function()
            builtin.grep_string({
                cwd = "~",
                search_dirs = CONFIG_DIRS,
                search = vim.fn.input("Grep Config > "),
            })
        end)
        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>pk", builtin.keymaps, {})
    end,
}
