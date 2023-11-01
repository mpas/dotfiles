return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "black",
        "autoflake",
        "flake8",
        "codespell",
        "misspell",
        "tflint",
      },
    },
  },
}
