return {
  -- Refactoring library based off the Refactoring book by Martin Fowler
  "ThePrimeagen/refactoring.nvim",
  config = function()
    require("refactoring").setup({})
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
}
