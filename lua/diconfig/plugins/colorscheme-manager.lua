local ColorMyPencils = function()
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "Yellow" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "Yellow", fg = "Black" })
end

return {
    -- dir = "/home/dinascimento/Documents/myProjects/custom_nvim_lua_plugs/colorscheme_telescope.nvim",
    -- name = "colorscheme-manager",
    "Diogo364/colorscheme-manager.nvim",
    -- tag = "0.3.0",
    branch = "feature_cache_file",
    priority = 1000,
    opts = {
        colorscheme = "rose-pine",
        enable_custom_options = true,
        custom_options_function = ColorMyPencils,
        autocmd = true,
    },
}
