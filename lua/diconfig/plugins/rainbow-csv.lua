return {
    "mechatroner/rainbow_csv",
    ft = {
        "csv",
        "tsv",
        "csv_semicolon",
        "csv_whitespace",
        "csv_pipe",
        "rfc_csv",
        "rfc_semicolon",
    },
    cmd = {
        "RainbowDelim",
        "RainbowDelimSimple",
        "RainbowDelimQuoted",
        "RainbowMultiDelim",
    },
    config = function()
        vim.cmd("let g:rbql_with_headers = 1")
    end,
}
