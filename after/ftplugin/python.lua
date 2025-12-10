local divider = "# %%"
local divider_pattern = "# %%%%"
local divider_hl_group_name = "PythonDivider"
local namespace_id = vim.api.nvim_create_namespace(divider_hl_group_name)
local group_python_divider =
    vim.api.nvim_create_augroup("group_python_divider", { clear = true })

vim.api.nvim_set_hl(0, divider_hl_group_name, {
    bg = "Gray",
    fg = "Black",
    ctermbg = "Gray",
    ctermfg = "Gray",
})

local highlight_divider_line = function()
    -- Delete all previous extmarks
    for _, extmark in
        pairs(vim.api.nvim_buf_get_extmarks(0, namespace_id, 0, -1, {}))
    do
        vim.api.nvim_buf_del_extmark(0, namespace_id, extmark[1])
    end

    -- Define new extmarks
    for i, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
        local match = string.match(line, divider_pattern)
        if match ~= nil then
            vim.api.nvim_buf_set_extmark(
                0,
                namespace_id,
                i - 1,
                0,
                { line_hl_group = divider_hl_group_name }
            )
        end
    end
end

vim.api.nvim_create_autocmd({ "BufEnter", "TextChangedI", "TextChanged" }, {
    group = group_python_divider,
    pattern = "*.py",
    callback = highlight_divider_line,
})

local write_divider = function(line, is_markdown)
    is_markdown = is_markdown or false
    local curr_divider = divider
    if is_markdown then
        curr_divider = curr_divider .. " [markdown]"
    end
    local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
    local target_line = cursor_line + line
    vim.api.nvim_buf_set_lines(
        0,
        target_line,
        target_line,
        false,
        { curr_divider }
    )
end

local find_next_divider = function()
    vim.cmd(string.format("/%s", divider))
end

local find_prev_divider = function()
    vim.cmd(string.format("?%s", divider))
end

local enter_next_cell = function()
    find_next_divider()
    vim.cmd("norm j")
end

local enter_prev_cell = function()
    find_prev_divider()
    find_prev_divider()
    vim.cmd("norm j")
end

vim.keymap.set("n", "<leader>cs", function()
    write_divider(-1)
end, { buffer = true, desc = "Split current cell" })

vim.keymap.set("n", "<leader>ct", function()
    find_next_divider()
    write_divider(-1, true)
    vim.cmd("norm O")
    vim.api.nvim_put({"# "}, "", false, true)
    vim.cmd("startinsert!")
end, { buffer = true, desc = "Split current cell" })

vim.keymap.set("n", "<leader>cT", function()
    find_prev_divider()
    write_divider(-1, true)
    vim.cmd("norm O")
    vim.api.nvim_put({"# "}, "", false, true)
    vim.cmd("startinsert!")
end, { buffer = true, desc = "Split current cell" })

vim.keymap.set(
    "n",
    "<leader>J",
    enter_next_cell,
    { buffer = true, desc = "Split current cell" }
)

vim.keymap.set(
    "n",
    "<leader>K",
    enter_prev_cell,
    { buffer = true, desc = "Split current cell" }
)

vim.keymap.set("n", "<leader>cO", function()
    write_divider(-1)
    find_prev_divider()
    vim.cmd("norm O")
    vim.cmd("startinsert")
end, { buffer = true, desc = "Split current cell" })

vim.keymap.set("n", "<leader>co", function()
    write_divider(0)
    find_next_divider()
    vim.cmd("norm o")
    vim.cmd("startinsert")
end, { buffer = true, desc = "Split current cell" })
