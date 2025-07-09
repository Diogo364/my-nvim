return {
    "nvim-lualine/lualine.nvim",
    -- enabled = false,
    priority = 1000,
    opts = function(_, config)
        -- Eviline config for lualine
        -- Author: shadmansaleh
        -- Credit: glepnir
        -- stylua: ignore
        local colors = {
            bg       = '#202328',
            fg       = '#bbc2cf',
            yellow   = '#ECBE7B',
            cyan     = '#008080',
            darkblue = '#081633',
            green    = '#98be65',
            orange   = '#FF8800',
            violet   = '#a9a1e1',
            magenta  = '#c678dd',
            blue     = '#51afef',
            red      = '#ec5f67',
            gray     = '#777777',
            darkgray = '#111111',
        }

        ---@param component table
        ---@param line_array table
        local function ins_component_on_lines(component, line_array)
            for _, line in pairs(line_array) do
                table.insert(line, component)
            end
        end

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand("%:p:h")
                local gitdir = vim.fn.finddir(".git", filepath .. ";")
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        config.options = {}
        config.options.component_separators = ""
        config.options.section_separators = ""
        config.options.theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.darkgray } },
        }
        config.sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            lualine_c = {},
            lualine_x = {},
        }
        config.inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            lualine_c = {},
            lualine_x = {},
        }
        config.winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {
                -- {
                --     "filename",
                --     file_status = true, -- Displays file status (readonly status, modified status)
                --     newfile_status = false, -- Display new file status (new file means no write after created)
                --     path = 3,
                --     shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                --     symbols = {
                --         modified = "[+]", -- Text to show when the file is modified.
                --         readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
                --         unnamed = "[No Name]", -- Text to show for unnamed buffers.
                --         newfile = "[New]", -- Text to show for newly created file before first write
                --     },
                --     color = { fg = colors.fg, gui = "italic" },
                -- },
            },
            lualine_y = {},
            lualine_z = {},
        }

        local left_active = config.sections.lualine_c
        local left_inactive = config.inactive_sections.lualine_c

        local right_active = config.sections.lualine_x
        local right_inactive = config.inactive_sections.lualine_x

        ins_component_on_lines({
            function()
                return "▊"
            end,
            color = { fg = colors.blue }, -- Sets highlighting of component
            padding = { left = 0, right = 1 }, -- We don't need space before this
        }, { left_active })

        ins_component_on_lines({
            function()
                return "▊"
            end,
            color = { fg = colors.gray }, -- Sets highlighting of component
            padding = { left = 0, right = 1 }, -- We don't need space before this
        }, { left_inactive })

        ins_component_on_lines({
            -- mode component
            function()
                return ""
            end,
            color = function()
                -- auto change color according to neovims mode
                local mode_color = {
                    n = colors.red,
                    i = colors.green,
                    v = colors.blue,
                    [""] = colors.blue,
                    V = colors.blue,
                    c = colors.magenta,
                    no = colors.red,
                    s = colors.orange,
                    S = colors.orange,
                    [""] = colors.orange,
                    ic = colors.yellow,
                    R = colors.violet,
                    Rv = colors.violet,
                    cv = colors.red,
                    ce = colors.red,
                    r = colors.cyan,
                    rm = colors.cyan,
                    ["r?"] = colors.cyan,
                    ["!"] = colors.red,
                    t = colors.red,
                }
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { right = 1 },
        }, { left_active })

        ins_component_on_lines({
            -- mode component
            function()
                return ""
            end,
            color = { fg = colors.gray },
            padding = { right = 1 },
        }, { left_inactive })

        ins_component_on_lines({
            "filename",
            cond = conditions.buffer_not_empty,
            path = 1,
            color = { fg = colors.magenta, gui = "bold" },
        }, { left_active, left_inactive })

        ins_component_on_lines({ "location" }, { left_active })

        ins_component_on_lines({
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
            diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.yellow },
                info = { fg = colors.cyan },
            },
        }, { left_active })

        -- Insert mid section. You can make any number of sections in neovim :)
        -- for lualine it's any number greater then 2
        ins_component_on_lines({
            function()
                return "%="
            end,
        }, { left_active })

        ins_component_on_lines({
            -- Lsp server name .
            function()
                local msg = "No Active Lsp"
                local buf_ft =
                    vim.api.nvim_get_option_value("filetype", { buf = 0 })
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            icon = " LSP:",
            color = { fg = "#ffffff", gui = "bold" },
        }, { left_active })

        -- Add components to right sections
        ins_component_on_lines({
            "o:encoding", -- option component same as &encoding in viml
            fmt = string.upper, -- I'm not sure why it's upper case either ;, {left_active})
            cond = conditions.hide_in_width,
            color = { fg = colors.green, gui = "bold" },
        }, { right_active })

        ins_component_on_lines({
            "filetype",
            fmt = string.upper,
            color = { fg = colors.green, gui = "bold" },
        }, { right_active })

        ins_component_on_lines({
            "branch",
            icon = "",
            color = { fg = colors.violet, gui = "bold" },
        }, { right_active })

        ins_component_on_lines({
            "diff",
            -- Is it me or the symbol for modified us really weird
            symbols = { added = " ", modified = "󰝤 ", removed = " " },
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.orange },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        }, { right_active })

        ins_component_on_lines({
            function()
                return "▊"
            end,
            color = { fg = colors.blue },
            padding = { left = 1 },
        }, { right_active })

        ins_component_on_lines({
            function()
                return "▊"
            end,
            color = { fg = colors.gray },
            padding = { left = 1 },
        }, { right_inactive })

        return config
    end,
}
