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
    "typescript",
    "tsx",
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
    },
    formatter = {
        "black",
        "isort",
    },
}

return M
