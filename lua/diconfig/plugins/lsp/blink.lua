return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "1.*",
    opts = {
        keymap = {
            preset = "default",
            ["<C-n>"] = { "show", "select_next", "fallback_to_mappings" },
            ["<C-u>"] = { "scroll_documentation_up", "fallback" },
            ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        completion = {
            list = {
                selection = { preselect = false, auto_insert = false },
            },
            ghost_text = { enabled = true },
        },
        signature = { enabled = true },
        sources = {
            default = { "buffer", "lsp", "path", "snippets" },
            per_filetype = {
                codecompanion = { "codecompanion" },
            },
            providers = {
                path = {
                    opts = {
                        get_cwd = function(_)
                            return vim.fn.getcwd()
                        end,
                    },
                },
            },
        },
    },
    opts_extend = { "sources.default" },
}
