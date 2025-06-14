local config = require("diconfig.plugins.llm.config.core")
local prompts = require("diconfig.plugins.llm.config.prompts")

return {
    "David-Kunz/gen.nvim",
    lazy = true,
    keys = {
        {
            mode = { "n", "v" },
            "<leader>gen",
            "<CMD>Gen<CR>",
            desc = "Invoke Gen on Ollama",
        },
    },
    config = function()
        local gen = require("gen")

        gen.setup({
            model = config.models.chat_model, -- The default model to use.
            quit_map = "q", -- set keymap to close the response window
            retry_map = "<C-R>", -- set keymap to re-send the current prompt
            accept_map = "<C-y>", -- set keymap to replace the previous selection with the last result
            host = config.setup.host, -- The host running the Ollama service.
            port = config.setup.port, -- The port on which the Ollama service is listening.
            display_mode = "horizontal-split", -- The display mode. Can be "float" or "split" or "horizontal-split".
            show_prompt = true, -- shows the prompt submitted to Ollama.
            show_model = true, -- Displays which model you are using at the beginning of your chat session.
            no_auto_close = true, -- Never closes the window automatically.
            file = true, -- Write the payload to a temporary file to keep the command short.
            hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
            init = function(options)
                pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
            end,
            -- Function to initialize Ollama
            command = function(options)
                local body = { model = options.model, stream = true }
                return "curl --silent --no-buffer -X POST http://"
                    .. options.host
                    .. ":"
                    .. options.port
                    .. "/api/chat -d $body"
            end,
            -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
            -- This can also be a command string.
            -- The executed command must return a JSON object with { response, context }
            -- (context property is optional).
            -- list_models = '<omitted lua function>', -- Retrieves a list of model names
            debug = false, -- Prints errors and the command which is run.
        })
        gen.prompts = prompts
    end,
}
