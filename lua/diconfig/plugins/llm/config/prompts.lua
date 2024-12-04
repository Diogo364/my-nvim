local config = require("diconfig.plugins.llm.config.core")

return {
    ["Generate"] = {
        prompt = "$input",
        model = config.models.chat_model,
    },
    ["Summarize"] = {
        prompt = "Summarize the following text:\n$text",
        model = config.models.chat_model,
    },
    ["Change"] = {
        prompt = "Change the following text, $input, just output the final text without additional quotes around it:\n$text",
        model = config.models.chat_model,
        replace = true,
    },
    ["Enhance_Grammar_Spelling"] = {
        prompt = "Modify the following text to improve grammar and spelling, just output the final text without additional quotes around it:\n$text",
        model = config.models.chat_model,
        replace = true,
    },
    ["Enhance_Wording"] = {
        prompt = "Modify the following text to use better wording, just output the final text without additional quotes around it:\n$text",
        model = config.models.chat_model,
        replace = true,
    },
    ["Make_Concise"] = {
        prompt = "Modify the following text to make it as simple and concise as possible, just output the final text without additional quotes around it:\n$text",
        model = config.models.chat_model,
        replace = true,
    },
    ["Make_List"] = {
        prompt = "Render the following text as a markdown list:\n$text",
        model = config.models.chat_model,
        replace = true,
    },
    ["Make_Table"] = {
        prompt = "Render the following text as a markdown table:\n$text",
        model = config.models.chat_model,
        replace = true,
    },
    ["Review_Code"] = {
        prompt = "Review the following code and make concise suggestions:\n```$filetype\n$text\n```",
        model = config.models.code_model,
    },
    ["Enhance_Code"] = {
        prompt = "Enhance the following code, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
        model = config.models.code_model,
        replace = true,
        extract = "```$filetype\n(.-)```",
    },
    ["Change_Code"] = {
        prompt = "Regarding the following code, $input, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
        model = config.models.code_model,
        replace = true,
        extract = "```$filetype\n(.-)```",
    },
    ["Create_Code"] = {
        model = config.models.code_model,
        prompt = "Create a code that is able to, $input, only output the result in format ```$filetype\n...\n```",
        extract = "```$filetype\n(.-)```",
    },
    ["Create_Code_Selection"] = {
        model = config.models.code_model,
        prompt = "Create a code that is able to, $text, only output the result in format ```$filetype\n...\n```",
        extract = "```$filetype\n(.-)```",
    },
}
