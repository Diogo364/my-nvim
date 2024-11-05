if vim.g.snippets ~= "luasnip" then
    return {}
end

local ls = require("luasnip")
local types = require("luasnip.util.types")

vim.snippet.expand = ls.lsp_expand

---@diagnostic disable-next-line: duplicate-set-field
vim.snippet.active = function(filter)
    filter = filter or {}
    filter.direction = filter.direction or 1

    if filter.direction == 1 then
        return ls.expand_or_jumpable()
    else
        return ls.jumpable(filter.direction)
    end
end

---@diagnostic disable-next-line: duplicate-set-field
vim.snippet.jump = function(direction)
    if direction == 1 then
        if ls.expandable() then
            return ls.expand_or_jump()
        else
            return ls.jumpable(1) and ls.jump(1)
        end
    else
        return ls.jumpable(-1) and ls.jump(-1)
    end
end

vim.snippet.stop = ls.unlink_current

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    override_builtin = true,
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<--", "Error" } },
            },
        },
    },
})

for _, ft_path in
    ipairs(
        vim.api.nvim_get_runtime_file(
            "lua/diconfig/plugins/snippets/after/*.lua",
            true
        )
    )
do
    vim.inspect(ft_path)
    loadfile(ft_path)()
end

vim.keymap.set({ "i", "s" }, "<C-K>", function()
    -- if ls.expand_or_jumpable() then
    --     ls.expand_or_jump()
    -- end
    return vim.snippet.active({ direction = 1 }) and vim.snippet.jump(1)
end, { silent = true, desc = "Jump into next position" })

vim.keymap.set({ "i", "s" }, "<C-J>", function()
    -- if ls.jumpable(-1) then
    --     ls.jump(-1)
    -- end
    return vim.snippet.active({ direction = -1 }) and vim.snippet.jump(-1)
end, { silent = true, desc = "Jump into previous position" })

vim.keymap.set({ "i", "s" }, "<C-L>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true, desc = "Toggle Choices" })

vim.keymap.set("n", "<leader>rls", function()
    local custom_snippets_path = vim.fs.joinpath(
        vim.fn.stdpath("config"),
        "lua/diconfig/plugins/snippets/init.lua"
    )
    loadfile(custom_snippets_path)()
end, { desc = "Reload LuaSnips module" })

return {}
