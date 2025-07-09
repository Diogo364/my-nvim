local detail = false
local custom_actions = {}
custom_actions.yank_entry = function(opts)
    opts = opts or {}
    local entry = require("oil").get_cursor_entry()
    local dir = require("oil").get_current_dir()
    if not entry or not dir then
        return
    end
    local path = dir .. entry.name
    if opts.modify then
        path = vim.fn.fnamemodify(path, opts.modify)
    end

    local reg = opts.register or vim.v.register

    vim.fn.setreg(reg, path)
end

local simple_view = { "icon" }
local detailed_view = { "icon", "permissions", "size", "mtime" }

---@diagnostic disable-next-line
function _G.get_oil_winbar()
    local dir = require("oil").get_current_dir()
    if dir then
        return vim.fn.fnamemodify(dir, ":~")
    else
        return vim.api.nvim_buf_get_name(0)
    end
end

return {
    "stevearc/oil.nvim",
    dependencies = { "echasnovski/mini.icons", opts = {} },
    opts = function()
        vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open Oil" })
        return {
            win_options = {
                winbar = "%!v:lua.get_oil_winbar()",
            },
            delete_to_trash = true,
            keymaps = {
                ["g?"] = "actions.show_help",
                ["gd"] = {
                    desc = "Toggle file detail view",
                    callback = function()
                        detail = not detail
                        if detail then
                            require("oil").set_columns(detailed_view)
                        else
                            require("oil").set_columns(simple_view)
                        end
                    end,
                },
                ["<CR>"] = "actions.select",
                ["<C-v>"] = {
                    "actions.select",
                    opts = { vertical = true, close = true },
                    desc = "Open the entry in a vertical split",
                },
                ["<C-x>"] = {
                    "actions.select",
                    opts = { horizontal = true, close = true },
                    desc = "Open the entry in a horizontal split",
                },
                ["<C-t>"] = {
                    "actions.select",
                    opts = { tab = true },
                    desc = "Open the entry in new tab",
                },
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-r>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = {
                    "actions.cd",
                    opts = { scope = "tab" },
                    desc = ":tcd to the current oil directory",
                },
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
                ["gy"] = {
                    desc = "Yank entry to clipboard",
                    callback = custom_actions.yank_entry,
                    opts = { register = "+", modify = ":." },
                },
                ["gY"] = {
                    desc = "Yank entry to clipboard",
                    callback = custom_actions.yank_entry,
                    opts = { register = "+" },
                },
            },
            use_default_keymaps = false,
            view_options = {
                show_hidden = true,
                is_hidden_file = function(name, _)
                    return vim.startswith(name, ".")
                end,
                is_always_hidden = function(name, _)
                    return vim.list_contains(AlwaysHidePattern, name)
                end,
                natural_order = true,
                case_insensitive = false,
                sort = {
                    { "type", "asc" },
                    { "name", "asc" },
                },
            },
        }
    end,
}
