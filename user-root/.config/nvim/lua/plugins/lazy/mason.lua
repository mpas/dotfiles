return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "autoflake",
        "black",
        "codespell",
        "flake8",
        "misspell",
        "shfmt",
        "stylua",
        "tflint",
        "bash-language-server",
      },
    },
  },
}
