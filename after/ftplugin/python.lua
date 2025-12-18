local divider = "# %%"
local markdown_divider_suffix = " - [markdown]"
local divider_pattern = "^# %%%%" -- Matches '# %%' at the start of a line
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

local function highlight_dividers()
    vim.api.nvim_buf_clear_namespace(0, namespace_id, 0, -1)

    for i, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
        if string.match(line, divider_pattern) then
            vim.api.nvim_buf_set_extmark(0, namespace_id, i - 1, 0, {
                line_hl_group = divider_hl_group_name,
            })
        end
    end
end

vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "TextChangedI" }, {
    group = group_python_divider,
    pattern = "*.py",
    callback = highlight_dividers,
    desc = "Highlight Python cell dividers",
})

local function insert_divider(line_nr, is_markdown)
    local line_content = is_markdown and (divider .. markdown_divider_suffix)
        or divider
    vim.api.nvim_buf_set_lines(
        0,
        line_nr - 1,
        line_nr - 1,
        false,
        { line_content }
    )
end

local function find_next_divider_line()
    return vim.fn.search(divider, "W")
end

local function find_prev_divider_line()
    return vim.fn.search(divider, "bW")
end

vim.keymap.set("n", "<leader>cs", function()
    local cursor_row, _ = unpack(vim.api.nvim_win_get_cursor(0))
    insert_divider(cursor_row, false)
    vim.api.nvim_win_set_cursor(0, { cursor_row, 0 })
end, { buffer = true, desc = "Create code divider at cursor" })

vim.keymap.set("n", "<leader>cm", function()
    local cursor_row, _ = unpack(vim.api.nvim_win_get_cursor(0))
    insert_divider(cursor_row, true)
    vim.api.nvim_win_set_cursor(0, { cursor_row + 1, 0 })
    vim.cmd("normal! o# ")
    vim.cmd("startinsert")
end, { buffer = true, desc = "Create markdown cell at cursor" })

vim.keymap.set("n", "<leader>cO", function()
    local prev_divider_line = find_prev_divider_line()
    if prev_divider_line == 0 then
        prev_divider_line = 1
    end

    insert_divider(prev_divider_line, false)
    vim.api.nvim_win_set_cursor(0, { prev_divider_line, 0 })
    vim.cmd("normal! O")
    vim.cmd("startinsert")
end, { buffer = true, desc = "Create new code cell above" })

vim.keymap.set("n", "<leader>co", function()
    local next_divider_line = find_next_divider_line()
    if next_divider_line == 0 then
        next_divider_line = vim.api.nvim_buf_line_count(0) + 1
    end
    insert_divider(next_divider_line, false)
    vim.api.nvim_win_set_cursor(0, { next_divider_line, 0 })
    vim.cmd("normal! o")
    vim.cmd("startinsert")
end, { buffer = true, desc = "Create new code cell below" })

vim.keymap.set("n", "<leader>cT", function()
    local prev_divider_line = find_prev_divider_line()
    if prev_divider_line == 0 then
        prev_divider_line = 1
    end

    insert_divider(prev_divider_line, true)
    vim.api.nvim_win_set_cursor(0, { prev_divider_line, 0 })
    vim.cmd("normal! o# ")
    vim.cmd("startinsert")
end, { buffer = true, desc = "Create new markdown cell above" })

vim.keymap.set("n", "<leader>ct", function()
    local next_divider_line = find_next_divider_line()
    if next_divider_line == 0 then
        next_divider_line = vim.api.nvim_buf_line_count(0) + 1
    end
    insert_divider(next_divider_line, true)
    vim.api.nvim_win_set_cursor(0, { next_divider_line, 0 })
    vim.cmd("normal! o# ")
    vim.cmd("startinsert")
end, { buffer = true, desc = "Create new markdown cell below" })

local enter_next_cell = function()
    local next_divider = find_next_divider_line()
    if next_divider ~= 0 then
        vim.api.nvim_win_set_cursor(0, { next_divider + 1, 0 })
    end
end

local enter_prev_cell = function()
    local prev_divider = find_prev_divider_line()
    if prev_divider == 0 then
        return
    end

    vim.api.nvim_win_set_cursor(0, { prev_divider, 0 })
    local new_prev_divider = find_prev_divider_line()
    if new_prev_divider == 0 then
        vim.api.nvim_win_set_cursor(0, { 1, 0 })
    else
        vim.api.nvim_win_set_cursor(0, { new_prev_divider + 1, 0 })
    end
end

vim.keymap.set(
    "n",
    "<leader>J",
    enter_next_cell,
    { buffer = true, desc = "Enter next cell" }
)
vim.keymap.set(
    "n",
    "<leader>K",
    enter_prev_cell,
    { buffer = true, desc = "Enter previous cell" }
)
