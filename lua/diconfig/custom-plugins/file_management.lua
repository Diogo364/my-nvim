vim.keymap.set("n", "<leader>fd", function()
    local curr_file = vim.fn.expand("%:.")
    local should_delete = nil

    vim.ui.input(
        { prompt = string.format("delete %s [y/n]: ", curr_file) },
        function(input)
            should_delete = input
        end
    )

    if should_delete == "y" then
        vim.cmd("Bdelete")
        os.remove(curr_file)
        print("Deleted ", curr_file)
    else
        print("Canceled")
    end
end, { desc = "Delete the current file" })

vim.keymap.set("n", "<leader>fc", function()
    local curr_file = vim.fn.expand("%:p")
    local new_filename = nil
    vim.ui.input({
        prompt = string.format("copy %s to:", curr_file),
        completion = "file",
        default = curr_file,
    }, function(input)
        new_filename = input
    end)
    if new_filename == nil then
        print("Canceled")
        return
    end
    vim.cmd({ cmd = "saveas", args = { new_filename } })
    print("Copied to: ", new_filename)
end, { desc = "Copied the current file" })

vim.keymap.set("n", "<leader>fm", function()
    local curr_file = vim.fn.expand("%:p")
    local new_filename = nil
    vim.ui.input({
        prompt = string.format("Move %s: ", curr_file),
        completion = "file",
        default = curr_file,
    }, function(input)
        new_filename = input
    end)
    if new_filename == nil then
        print("Canceled")
        return
    end
    vim.cmd("bdelete")
    os.rename(curr_file, new_filename)
    print("Moved to: ", new_filename)
    vim.cmd(string.format("e %s", new_filename))
end, { desc = "Move the current file" })

vim.keymap.set("n", "<leader>fn", function()
    local cwd = vim.fs.dirname(vim.fn.expand("%")) .. "/"
    local new_f = nil

    vim.ui.input(
        { prompt = "new file name: ", default = cwd, completion = "file" },
        function(input)
            new_f = input
        end
    )
    if new_f == nil then
        print("Canceled")
        return
    end
    if vim.fn.filereadable(new_f) == 1 then
        error(string.format("File %s already exists.", new_f))
    end

    vim.cmd(string.format("e %s", new_f))
    vim.cmd("w")

    print(string.format("Created %s", new_f))
end, { desc = "Create a new file" })

vim.keymap.set(
    "n",
    "<leader><leader>n",
    ":e /tmp/tmp.txt<cr>",
    { desc = "Open temporary file" }
)
