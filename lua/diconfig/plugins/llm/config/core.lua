M = {}

local setup = {}
setup.host = "localhost"
setup.port = "11434"
setup.url = string.format("http://%s:%s", setup.host, setup.port)

return {
    setup = setup,
    models = {
        chat_model = "qwen2.5:3b-instruct",
        code_model = "qwen2.5-coder:3b",
    },
}
