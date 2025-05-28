M = {}

M.treesitter = {
    "bash",
    "c",
    "dockerfile",
    "dot",
    "html",
    "javascript",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "python",
    "regex",
    "rust",
    "toml",
    "tsx",
    "typescript",
    "typst",
    "vimdoc",
    "yaml",
}

M.mason = {
    lsp = {
        "bashls",
        "docker_compose_language_service",
        "dockerls",
        "gopls",
        "jsonls",
        "lua_ls",
        "markdown_oxide",
        "pyright",
        "rust_analyzer",
        "html",
        "cssls",
        "tailwindcss",
        "ts_ls",
    },
    formatter = {
        "black",
        "isort",
        "prettierd",
    },
}

return M
