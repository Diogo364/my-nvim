return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })

        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
        vim.keymap.set("n", "<leader>r1", function() harpoon:list():replace_at(1) end)
        vim.keymap.set("n", "<leader>r2", function() harpoon:list():replace_at(2) end)
        vim.keymap.set("n", "<leader>r3", function() harpoon:list():replace_at(3) end)
        vim.keymap.set("n", "<leader>r4", function() harpoon:list():replace_at(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end
}
