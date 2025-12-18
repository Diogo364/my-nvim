return {
    "Vigemus/iron.nvim",
    config = function()
        local iron = require("iron.core")
        local view = require("iron.view")
        local common = require("iron.fts.common")

        iron.setup({
            config = {
                -- Whether a repl should be discarded or not
                scratch_repl = true,
                repl_definition = {
                    sh = {
                        command = { "zsh" },
                    },
                    lua = {
                        command = { "lua" },
                    },
                    python = {
                        command = { "ipython3", "-i", "--no-autoindent" },
                        format = common.bracketed_paste_python,
                        block_dividers = { "# %%", "#%%" },
                        env = { PYTHON_BASIC_REPL = "1" },
                    },
                },
                -- set the file type of the newly created repl to ft
                -- bufnr is the buffer id of the REPL and ft is the filetype of the
                -- language being used for the REPL.
                repl_filetype = function(bufnr, ft)
                    return ft
                    -- or return a string name such as the following
                    -- return "iron"
                end,
                -- Send selections to the DAP repl if an nvim-dap session is running.
                dap_integration = true,
                repl_open_cmd = view.split.horizontal.botright(0.20),
            },
            keymaps = {
                toggle_repl = "<space>rr", -- toggles the repl open and closed.
                restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
                send_motion = "<space>sc",
                visual_send = "<space>sc",
                send_file = "<space>sf",
                send_line = "<space>sl",
                send_paragraph = "<space>sp",
                send_until_cursor = "<space>su",
                send_mark = "<space>sm",
                send_code_block = "<space>sb",
                send_code_block_and_move = "<space>sn",
                mark_motion = "<space>mc",
                mark_visual = "<space>mc",
                remove_mark = "<space>md",
                cr = "<space>s<cr>",
                interrupt = "<space>s<space>",
                exit = "<space>sq",
                clear = "<space>cl",
            },
            -- If the highlight is on, you can change how it looks
            -- For the available options, check nvim_set_hl
            highlight = {
                italic = true,
            },
            ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
        })

        -- iron also has a list of commands, see :h iron-commands for all available commands
        vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>")
        vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")
    end,
}
