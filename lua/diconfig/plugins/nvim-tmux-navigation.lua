return {
    "alexghergh/nvim-tmux-navigation",
    config = function()
        local nvim_tmux_nav = require("nvim-tmux-navigation")

        nvim_tmux_nav.setup({
            disable_when_zoomed = true,
        })

        vim.keymap.set(
            "n",
            "<C-h>",
            nvim_tmux_nav.NvimTmuxNavigateLeft,
            { desc = "Navigate left between vim and tmux" }
        )
        vim.keymap.set(
            "n",
            "<C-j>",
            nvim_tmux_nav.NvimTmuxNavigateDown,
            { desc = "Navigate down between vim and tmux" }
        )
        vim.keymap.set(
            "n",
            "<C-k>",
            nvim_tmux_nav.NvimTmuxNavigateUp,
            { desc = "Navigate up between vim and tmux" }
        )
        vim.keymap.set(
            "n",
            "<C-l>",
            nvim_tmux_nav.NvimTmuxNavigateRight,
            { desc = "Navigate right between vim and tmux" }
        )
        vim.keymap.set(
            "n",
            "<C-\\>",
            nvim_tmux_nav.NvimTmuxNavigateLastActive,
            { desc = "Navigate to the last active vim or tmux pane" }
        )
    end,
}
