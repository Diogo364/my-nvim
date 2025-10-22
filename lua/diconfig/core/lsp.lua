for fn, _ in vim.fs.dir(vim.fn.stdpath("config") .. "/lsp") do
    local fn = string.gsub(fn, ".lua", "")
    vim.lsp.enable(fn)
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", {
            desc = "Show LSP references",
            buffer = bufnr,
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
            desc = "Go to declaration",
            buffer = bufnr,
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", {
            desc = "Show LSP definition",
            buffer = bufnr,
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", {
            desc = "Show LSP implementation",
            buffer = bufnr,
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", {
            desc = "Show LSP type definitions",
            buffer = bufnr,
            noremap = true,
            silent = true,
        })
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
            desc = "See available code actions",
            buffer = bufnr,
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
            desc = "Smart rename",
            buffer = bufnr,
            noremap = true,
            silent = true,
        })
        vim.keymap.set(
            "n",
            "<leader>D",
            "<cmd>Telescope diagnostics bufnr=0<CR>",
            {
                desc = "Show buffer diagnostic",
                buffer = bufnr,
                noremap = true,
                silent = true,
            }
        )
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {
            desc = "Show documentation for what is under cursor",
            buffer = bufnr,
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {
            desc = "Show documentation for what is under cursor",
            buffer = bufnr,
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", {
            desc = "Restart LSP",
            buffer = bufnr,
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, {
            desc = "Signature Help",
            buffer = bufnr,
            noremap = true,
            silent = true,
        })

        vim.keymap.set(
            "n",
            "<leader>gf",
            vim.lsp.buf.format,
            { desc = "Format code using LSP" }
        )
    end,
})

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󰌶",
            [vim.diagnostic.severity.INFO] = "",
        },
    },
})
