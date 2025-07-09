return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            signatureHelp = { enabled = true },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    vim.fn.stdpath("config"),
                    "${3rd}/luv/library",
                },
            },
            diagnostics = {
                globals = {
                    "bit",
                    "vim",
                    "it",
                    "describe",
                    "before_each",
                    "after_each",
                },
            },
        },
    },
}
