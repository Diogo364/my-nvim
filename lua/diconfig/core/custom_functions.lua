-- Functions

-- Table print shortcut
P = function(table_object)
    print(vim.inspect(table_object))
    return table_object
end

if pcall(require, "plenary") then
    RELOAD = require("plenary.reload").reload_module
    R = function(module)
        RELOAD(module)
        return require(module)
    end
end

-- Check if specific buffer
function is_specific_buffer(bufnr, name)
    return (vim.api.nvim_buf_get_name(bufnr) == name)
end

-- Check if a buffer is an empty unnamed buffer
function is_empty_unnamed_buffer(bufnr)
    -- Get all lines in the buffer
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    -- Initialize a variable to store the total number of characters
    local total_characters = 0

    -- Iterate over each line and calculate the number of characters
    for _, line in ipairs(lines) do
        total_characters = total_characters + #line
    end

    -- Close the buffer if it's empty:
    return (
        vim.api.nvim_buf_is_loaded(bufnr)
        and is_specific_buffer(bufnr, "")
        and vim.api.nvim_get_option_value("buftype", { buf = 0 }) == ""
        and total_characters == 0
    )
end

-- Closes empty unnamed buffers
function close_matched_buffers(opts)
    opts = opts or {}
    if opts.compare_func == nil then
        opts = { compare_func = is_empty_unnamed_buffer }
    end

    -- Get a list of all buffers
    local buffers = vim.api.nvim_list_bufs()

    -- Iterate over each buffer
    for _, bufnr in ipairs(buffers) do
        -- Check if the buffer is empty and doesn't have a name
        if opts.compare_func(bufnr) then
            vim.api.nvim_buf_delete(bufnr, {
                force = true,
            })
        end
    end
end

-- Autocmds

-- Close empty_unnamed_buffer when openning new buffer
local group_empty_buffer = vim.api.nvim_create_augroup("group_empty_unnamed_buffer", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "",
    callback = function()
        close_matched_buffers()
    end,
    group = group_empty_buffer,
})

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
