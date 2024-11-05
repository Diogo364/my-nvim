local custom_mappings = require("diconfig.plugins.custom-telescope.custom-mappings")
local buffer_previewer_maker = require("diconfig.plugins.custom-telescope.custom-functions").buffer_previewer_maker

M = {
    defaults = {
        -- path_display = { "smart" },
        -- file_ignore_patterns = AlwaysHidePattern,

        buffer_previewer_maker = buffer_previewer_maker,
        preview = {
            filesize_limit = 0.5, -- MB
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
                preview_width = 0.4,
            },
            width = 0.8,
            height = 0.8,
            preview_cutoff = 100,
        },
    },

    pickers = {
        find_files = {
            mappings = custom_mappings.find_files,
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
    extensions = {
        ["fzf"] = {
            fuzzy = true,          -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        ["live_grep_args"] = {
            auto_quoting = true,
            mappings = custom_mappings.live_grep_args,
        },
    },
}

require("telescope").setup(M)
require("diconfig.plugins.custom-telescope.keybindings")
