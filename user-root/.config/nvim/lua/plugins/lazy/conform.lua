return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
        hcl = { "packer_fmt", "terraform_fmt" },
        html = { "prettier" },
        markdown = { "markdownlint" },
      },
      -- formatters = {
      --   packer_fmt = {
      --     command = "packer",
      --     args = { "fmt", "-" },
      --   },
      -- },
    },
  },
}
