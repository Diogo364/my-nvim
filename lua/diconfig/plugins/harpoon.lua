return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add file to Harpoon list" })

		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open Harpoon window" })

		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Select first Harpoon file" })

		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Select second Harpoon file" })

		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Select third Harpoon file" })

		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Select fourth Harpoon file" })

		vim.keymap.set("n", "<leader>5", function()
			harpoon:list():select(5)
		end, { desc = "Select fifth Harpoon file" })

		vim.keymap.set("n", "<leader>r1", function()
			harpoon:list():replace_at(1)
		end, { desc = "Replace first Harpoon file" })

		vim.keymap.set("n", "<leader>r2", function()
			harpoon:list():replace_at(2)
		end, { desc = "Replace second Harpoon file" })

		vim.keymap.set("n", "<leader>r3", function()
			harpoon:list():replace_at(3)
		end, { desc = "Replace third Harpoon file" })

		vim.keymap.set("n", "<leader>r4", function()
			harpoon:list():replace_at(4)
		end, { desc = "Replace fourth Harpoon file" })

		vim.keymap.set("n", "<leader>r5", function()
			harpoon:list():replace_at(5)
		end, { desc = "Replace fourth Harpoon file" })

		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end, { desc = "Switch to previous Harpoon buffer" })

		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end, { desc = "Switch to next Harpoon buffer" })
	end,
}
