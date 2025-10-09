-- Redirect command output to new unlisted-buffer
vim.api.nvim_create_user_command("Redir", function(ctx)
    local lines = vim.split(
        vim.api.nvim_exec2(ctx.args, { output = true }).output,
        "\n",
        { plain = true }
    )
    vim.cmd("new")
    vim.cmd("set nobuflisted")
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.opt_local.modified = false
end, { nargs = "+", complete = "command" })

--Switch Case: PascalCase with snake_case
function SwitchCase()
    local pos = vim.api.nvim_win_get_cursor(0)
    local line = pos[1]
    local col = pos[2]

    local word = vim.fn.expand("<cword>")
    local word_start = vim.fn.matchstrpos(
        vim.fn.getline("."),
        "\\k*\\%" .. (col + 1) .. "c\\k*"
    )[2]

    -- Detect camelCase
    if word:find("[a-z][A-Z]") then
        -- Convert camelCase to snake_case
        local snake_case_word = word:gsub("([a-z])([A-Z])", "%1_%2"):lower()
        snake_case_word = snake_case_word:gsub("^([a-z])", "%1"):lower()

        vim.api.nvim_buf_set_text(
            0,
            line - 1,
            word_start,
            line - 1,
            word_start + #word,
            { snake_case_word }
        )
    -- Detect snake_case
    elseif word:find("_[a-z]") then
        -- Convert snake_case to PascalCase
        local pascal_case_word = word:gsub("(_)([a-z])", function(_, l)
            return l:upper()
        end)
        pascal_case_word = pascal_case_word:gsub("^([a-z])", function(l)
            return l:upper()
        end)

        vim.api.nvim_buf_set_text(
            0,
            line - 1,
            word_start,
            line - 1,
            word_start + #word,
            { pascal_case_word }
        )
    else
        print("Not a snake_case or PascalCase word")
    end
end

---Lua function encapsulation for a simple wget call
---@param url string
---@param dest string? Output path (Default="./"). Both file or dir are accepted. Should end with / to be considered a dir, though.
function DownloadFile(url, dest)
    if url == nil then
        error("url parameter is mandatory")
    end

    dest = dest or "./"

    if not pcall(require, "plenary") then
        error("Plenary is not installed.")
    end

    local Job = require("plenary.job")
    local path = require("plenary.path")

    local download_path = path:new(dest)
    local base_dir = download_path
    local is_dest_a_dir = string.sub(dest, #dest, #dest) == "/"

    local args = {}

    if not is_dest_a_dir then
        base_dir = download_path:parent()
        args = {
            "-O",
            download_path.filename,
        }
    else
        args = {
            "-P",
            base_dir.filename,
        }
    end

    table.insert(args, url)

    if base_dir:exists() then
        local ui_answer = nil
        vim.ui.input({
            prompt = string.format(
                "Directory %s already exists, would you like to continue the download [y/n]? ",
                base_dir:absolute()
            ),
        }, function(user_input)
            ui_answer = user_input
            print("\n")
        end)

        if ui_answer ~= "y" then
            print("Aborted")
            return
        end
    end

    base_dir:mkdir({ exists_ok = true, parents = true })

    Job:new({
        command = "wget",
        args = args,
        on_exit = function(j, return_val)
            if return_val ~= 0 then
                print("Error: " .. table.concat(j:stderr_result(), "\n"))
            else
                print("Successfully downloaded at ", download_path:absolute())
            end
        end,
    }):sync()
end

---Downloads my devcontainer default configuration inside .devcontainer/ folder
function DownloadDevcontainerTemplate()
    DownloadFile(
        "https://raw.githubusercontent.com/Diogo364/docker-library/refs/heads/main/.devcontainer/devcontainer.json",
        ".devcontainer/"
    )
end

vim.api.nvim_create_user_command("DownloadFile", function(args)
    DownloadFile(args.fargs[1], args.fargs[2])
end, {
    nargs = "*",
    complete = "file",
    desc = "Download my custom devcontainer template from GH",
})

vim.api.nvim_create_user_command(
    "DownloadDevcontainerTemplate",
    DownloadDevcontainerTemplate,
    { desc = "Download my custom devcontainer template from GH" }
)
