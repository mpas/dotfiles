return {
  -- Distraction-free coding for Neovim
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup({
      window = {
        width = 0.70,
        options = {
          signcolumn = "no",
        },
      },
    })
  end,
}
