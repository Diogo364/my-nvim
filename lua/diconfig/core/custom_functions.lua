-- Functions

-- Table print shortcut
P = function(table_object)
    print(vim.inspect(table_object))
    return table_object
end

-- Autocmds

-- Enters in provided path on Neovim Openning
local group_cdpwd = vim.api.nvim_create_augroup("group_cdpwd", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
    group = group_cdpwd,
    pattern = "*",
    callback = function()
        local cwd = nil
        if package.loaded.oil ~= nil then
            cwd = require("oil").get_current_dir()
        else
            cwd = vim.fn.expand("%:p:h")
        end
        vim.api.nvim_set_current_dir(cwd)
    end,
})
