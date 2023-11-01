return {
  -- Generate docstrings automatically.
  "danymat/neogen",
  config = function()
    require("neogen").setup({
      snippet_engine = "luasnip",
      enabled = true,
      languages = {
        python = {
          template = {
            annotation_convention = "google_docstrings",
          },
        },
      },
    })
  end,
  dependencies = "nvim-treesitter/nvim-treesitter",
}
