M = {}

local setup = {}
setup.host = "localhost"
setup.port = "11434"
setup.url = string.format("http://%s:%s", setup.host, setup.port)

return {
    setup = setup,
    models = {
        chat_model = "llama3.2:1b",
        code_model = "codellama:7b",
    },
}
