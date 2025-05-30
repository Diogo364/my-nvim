M = {}

local setup = {}
local env = vim.fn.environ()
setup.host = env["NVIM_LLM_HOST"] or "localhost"
setup.port = env["NVIM_LLM_PORT"] or "11434"
setup.url = string.format("http://%s:%s", setup.host, setup.port)

return {
    setup = setup,
    models = {
        chat_model = env["NVIM_LLM_CHAT_MODEL"] or "qwen2.5:3b-instruct",
        code_model = env["NVIM_LLM_CODE_MODEL"] or "qwen2.5-coder:3b",
    },
}
