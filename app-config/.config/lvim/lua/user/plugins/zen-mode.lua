-- Distraction-free coding for Neovim
return { "folke/zen-mode.nvim",
    config = function()
        require("zen-mode").setup({
            window = {
                width = .75
            }
        })
    end,
}
