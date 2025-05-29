local config = require("diconfig.plugins.llm.config.core")

return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "MeanderingProgrammer/render-markdown.nvim",
        "echasnovski/mini.diff",
    },
    opts = {
        strategies = {
            chat = {
                adapter = "code",
            },
            inline = {
                adapter = "code",
            },
        },
        adapters = {
            code = function()
                return require("codecompanion.adapters").extend("ollama", {
                    name = "code",
                    schema = {
                        model = {
                            default = config.models.code_model,
                        },
                    },
                    env = {
                        url = config.setup.url,
                    },
                })
            end,
            chat = function()
                return require("codecompanion.adapters").extend("ollama", {
                    name = "chat",
                    schema = {
                        model = {
                            default = config.models.chat_model,
                        },
                    },
                    env = {
                        url = config.setup.url,
                    },
                })
            end,
            opts = {
                show_defaults = false,
            },
        },
        opts = {
            log_level = "ERROR",
        },
        display = {
            action_palette = {
                width = 95,
                height = 10,
                prompt = "Prompt ", -- Prompt used for interactive LLM calls
                provider = "default", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
                opts = {
                    show_default_actions = true, -- Show the default actions in the action palette?
                    show_default_prompt_library = true, -- Show the default prompt library in the action palette?
                },
            },
        },
    },
}
