if not vim.filetype then
    return
end

vim.filetype.add({
    extension = {
        lock = "yaml",
    },
    filename = {
        [".gitignore"] = "conf",
    },
    pattern = {
        [".env.*"] = "sh",
        ["*.Dockerfile.*"] = "dockerfile",
        [".*/i3/.*"] = "i3config",
        [".*/dunst/.*"] = "conf",
        [".*/tmux/.*"] = "tmux",
    },
})
