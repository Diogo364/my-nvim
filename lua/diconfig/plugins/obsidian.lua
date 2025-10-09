MY_VAULT = vim.fn.expand("~/Documents/Personal/my-obsidian")

local group_obsidian =
    vim.api.nvim_create_augroup("group_obsidian", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = group_obsidian,
    pattern = "*",
    callback = function()
        local cwd = vim.fn.getcwd()

        if vim.startswith(cwd, MY_VAULT) then
            require("obsidian")
        else
            require("render-markdown")
        end
    end,
})

return {
    "obsidian-nvim/obsidian.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    version = "*",
    lazy = true,
    config = function()
        require("obsidian").setup({
            legacy_commands = false,
            workspaces = {
                {
                    name = "personal",
                    path = MY_VAULT .. "/personal",
                    strict = true,
                    overrides = {
                        new_notes_location = "notes_subdir",
                        notes_subdir = "inbox",
                    },
                },
                {
                    name = "work",
                    path = MY_VAULT .. "/work",
                    strict = true,
                    overrides = {
                        new_notes_location = "notes_subdir",
                        notes_subdir = "inbox",
                    },
                },
            },
            completion = {
                nvim_cmp = false,
                blink = true,
                min_chars = 0,
                match_case = true,
                create_new = true,
            },
            picker = {
                name = "telescope.nvim",
            },
            note_id_func = function(title)
                -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                -- In this case a note with the title 'My new note' will be given an ID that looks
                -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                local suffix = ""
                if title ~= nil then
                    -- If title is given, transform it into valid file name.
                    suffix =
                        title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    -- If title is nil, just add 4 random uppercase letters to the suffix.
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                end
                return tostring(os.time()) .. "-" .. suffix
            end,
            templates = {
                folder = "templates",
                date_format = "%Y-%m-%d-%a",
                time_format = "%H:%M",
            },
            footer = {
                enabled = false,
                separator = false,
            },
        })

        vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<cr>", {
            desc = "Create new note",
        })
    end,
}
