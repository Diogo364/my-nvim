return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
        {
            "<leader>a",
            function()
                require("harpoon"):list():add()
            end,
            desc = "Add file to Harpoon list",
        },

        {
            "<C-e>",
            function()
                require("harpoon").ui:toggle_quick_menu(
                    require("harpoon"):list()
                )
            end,
            desc = "Open Harpoon window",
        },

        {
            "<leader>1",
            function()
                require("harpoon"):list():select(1)
            end,
            desc = "Select first Harpoon file",
        },

        {
            "<leader>2",
            function()
                require("harpoon"):list():select(2)
            end,
            desc = "Select second Harpoon file",
        },

        {
            "<leader>3",
            function()
                require("harpoon"):list():select(3)
            end,
            desc = "Select third Harpoon file",
        },

        {
            "<leader>4",
            function()
                require("harpoon"):list():select(4)
            end,
            desc = "Select fourth Harpoon file",
        },

        {
            "<leader>5",
            function()
                require("harpoon"):list():select(5)
            end,
            desc = "Select fifth Harpoon file",
        },

        {
            "<leader>r1",
            function()
                require("harpoon"):list():replace_at(1)
            end,
            desc = "Replace first Harpoon file",
        },

        {
            "<leader>r2",
            function()
                require("harpoon"):list():replace_at(2)
            end,
            desc = "Replace second Harpoon file",
        },

        {
            "<leader>r3",
            function()
                require("harpoon"):list():replace_at(3)
            end,
            desc = "Replace third Harpoon file",
        },

        {
            "<leader>r4",
            function()
                require("harpoon"):list():replace_at(4)
            end,
            desc = "Replace fourth Harpoon file",
        },

        {
            "<leader>r5",
            function()
                require("harpoon"):list():replace_at(5)
            end,
            desc = "Replace fourth Harpoon file",
        },

        {
            "<C-S-P>",
            function()
                require("harpoon"):list():prev()
            end,
            desc = "Switch to previous Harpoon buffer",
        },

        {
            "<C-S-N>",
            function()
                require("harpoon"):list():next()
            end,
            desc = "Switch to next Harpoon buffer",
        },
    },
}
