return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            indent = {
                enable = true,
            },
            highlight = {
                additional_vim_regex_highlighting = { "markdown" },
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
                    if stats and stats.size > max_filesize then
                        return true
                    end
                    if vim.tbl_contains({ "csv", "tsv" }, lang) then
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
