return {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = "BufEnter",
    build = ":TSUpdate",
    config = function()
        local disabled_lang_list = { "csv", "tsv" }
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "bash",
                "c",
                "dockerfile",
                "dot",
                "html",
                "json",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "rust",
                "toml",
                "vimdoc",
                "yaml",
            },

            ignore_install = {},

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = true,

            indent = {
                enable = true,
            },

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = { "markdown" },

                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats =
                        pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                    if vim.tbl_contains(disabled_lang_list, lang) then
                        return true
                    end
                end,
            },
        })

        local treesitter_parser_config =
            require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = { "src/parser.c", "src/scanner.c" },
                branch = "master",
            },
        }

        vim.treesitter.language.register("templ", "templ")
    end,
}
