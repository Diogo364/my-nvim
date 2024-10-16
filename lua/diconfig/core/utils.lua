-- Execute Lua line
function RunLuaLine()
    local pos_list = {
        vim.fn.getpos("v")[2],
        vim.fn.getpos(".")[2],
    }
    table.sort(pos_list)

    local line_start = pos_list[1]
    local line_end = pos_list[2]

    local cmd = vim.api.nvim_buf_get_lines(0, line_start - 1, line_end, false)
    if cmd == nil then
        return nil
    end

    local concatenated_cmd = table.concat(cmd, "\n")
    print("Run: ", concatenated_cmd)
    load(concatenated_cmd)()
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
end, { nargs = "*", complete = "file", desc = "Download my custom devcontainer template from GH" })

vim.api.nvim_create_user_command(
    "DownloadDevcontainerTemplate",
    DownloadDevcontainerTemplate,
    { desc = "Download my custom devcontainer template from GH" }
)
