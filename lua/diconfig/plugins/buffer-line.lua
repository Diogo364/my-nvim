return {
    "akinsho/bufferline.nvim",
    version = "*",
    priority = 1000,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "moll/vim-bbye",
    },
    config = function()
        local bufferline = require("bufferline")

        bufferline.setup({
            options = {
                mode = "buffers", -- set to "tabs" to only show tabpages instead
                style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
                themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
                numbers = "none",
                close_command = "Bdelete! %d", -- can be a string | function, | false see "Mouse actions"
                right_mouse_command = "Bdelete! %d", -- can be a string | function | false, see "Mouse actions"
                left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
                middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
                indicator = {
                    icon = "▎-", -- this should be omitted if indicator style is not 'icon'
                    style = "icon", -- | "underline" | "none",
                },
                buffer_close_icon = "󰅖",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 18,
                max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                truncate_names = true, -- whether or not tab names should be truncated
                tab_size = 18,
                diagnostics = false, -- | "nvim_lsp" | "coc",
                diagnostics_update_in_insert = false, -- only applies to coc
                diagnostics_update_on_event = true, -- use nvim's diagnostic handler

                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "NeoTree",
                        text_align = "left", -- "left" | "center" | "right"
                        separator = true,
                    },
                },
                color_icons = true, -- whether or not to add the filetype icon highlights
                get_element_icon = function(element)
                    local icon, hl =
                        require("nvim-web-devicons").get_icon_by_filetype(
                            element.filetype,
                            { default = false }
                        )
                    return icon, hl
                end,
                show_buffer_icons = true, -- disable filetype icons for buffers
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
                duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
                separator_style = "thin", -- "slant",| "slope" | "thick" | "thin" | { "any", "any" },
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                auto_toggle_bufferline = true,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { "close" },
                },
                sort_by = "insert_after_current",
            },
        })

        -- Custom keymappings for plugin
        vim.keymap.set(
            "n",
            "[b",
            ":BufferLineCyclePrev<CR>",
            { silent = true, desc = "Go to previous buffer" }
        )
        vim.keymap.set(
            "n",
            "]b",
            ":BufferLineCycleNext<CR>",
            { silent = true, desc = "Go to next buffer" }
        )
        vim.keymap.set(
            "n",
            "<leader>q",
            ":Bdelete %<CR>",
            { silent = true, desc = "Close current buffer" }
        )
        vim.keymap.set(
            "n",
            "<leader>fq",
            ":Bdelete! %<CR>",
            { silent = true, desc = "Force close current buffer" }
        )
        vim.keymap.set("n", "<leader><leader>q", function()
            bufferline = require("bufferline")
            for _, e in ipairs(bufferline.get_elements().elements) do
                if vim.fn.getbufinfo(e.id)[1].hidden == 1 then
                    vim.schedule(function()
                        vim.cmd.Bdelete({ args = { e.id } })
                        vim.cmd.redraw({ bang = true })
                    end)
                end
            end
        end, {
            silent = true,
            desc = "Close all buffers except current",
        })
    end,
}
