-- Functions

-- Table print shortcut
P = function(table_object)
    print(vim.inspect(table_object))
    return table_object
end

---@param content table<string, boolean>
---@param opts? table
---@param bufnr? integer
SendToNewScratchBuffer = function(content, opts, bufnr)
    bufnr = bufnr or vim.api.nvim_create_buf(false, true)
    opts = opts or {}

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, content)
    for opt, val in pairs(opts) do
        vim.api.nvim_set_option_value(opt, val, { buf = bufnr })
    end
    return bufnr
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

-- Commands
vim.api.nvim_create_user_command("TSPlayground", function()
    vim.cmd("InspectTree")
    vim.cmd("EditQuery")
end, { desc = "Open Treesitter query layout" })

-- Autocmds

-- Close empty_unnamed_buffer when openning new buffer
local group_empty_buffer =
    vim.api.nvim_create_augroup("group_empty_unnamed_buffer", { clear = true })
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
        local _, cwd = pcall(require("oil").get_current_dir)
        if cwd == nil then
            cwd = vim.fn.expand("%:p:h")
        end
        vim.api.nvim_set_current_dir(cwd)
    end,
})

local group_term_bufr =
    vim.api.nvim_create_augroup("group_term_bufr", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_option_value("buflisted", false, { buf = 0 })
    end,
    group = group_term_bufr,
})

local group_custom_filetype =
    vim.api.nvim_create_augroup("group_custom_filetype", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "set fo-=ro",
    group = group_custom_filetype,
})
