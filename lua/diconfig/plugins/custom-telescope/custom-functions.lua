local previewers = require("telescope.previewers")
local Job = require("plenary.job")

M = {}

---@diagnostic disable-next-line: duplicate-set-field
M.focus_preview = function(prompt_bufnr)
    local action_state = require("telescope.actions.state")
    local picker = action_state.get_current_picker(prompt_bufnr)
    local prompt_win = picker.prompt_win
    local previewer = picker.previewer
    local winid = previewer.state.winid
    local bufnr = previewer.state.bufnr

    vim.keymap.set("n", "<Tab>", function()
        vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
    end, { buffer = bufnr })

    vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
    -- api.nvim_set_current_win(winid)
end

---@diagnostic disable-next-line: duplicate-set-field
M.yank_entry = function(input_table)
    input_table = input_table or {}
    local relative_path = input_table.relative_path

    local entry = require("telescope.actions.state").get_selected_entry()

    local curr_path = entry.path
    if relative_path then
        curr_path = entry[1]
    end
    print(curr_path)

    local cb_opts = vim.opt.clipboard:get()
    if vim.tbl_contains(cb_opts, "unnamed") then
        vim.fn.setreg("*", curr_path)
    end
    if vim.tbl_contains(cb_opts, "unnamedplus") then
        vim.fn.setreg("+", curr_path)
    end
    vim.fn.setreg("", curr_path)
end

---@diagnostic disable-next-line: duplicate-set-field
M.system_open_file = function()
    local entry = require("telescope.actions.state").get_selected_entry()
    print("Opening: ", entry)
    vim.ui.open(entry.path)
end

---@diagnostic disable-next-line: duplicate-set-field
M.buffer_previewer_maker = function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    Job:new({
        command = "file",
        args = { "--mime-type", "-b", filepath },
        on_exit = function(j)
            local mime_type = vim.split(j:result()[1], "/")[1]
            if mime_type == "text" then
                previewers.buffer_previewer_maker(filepath, bufnr, opts)
            else
                -- maybe we want to write something to the buffer here
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
                end)
            end
        end,
    }):sync()
end

return M
