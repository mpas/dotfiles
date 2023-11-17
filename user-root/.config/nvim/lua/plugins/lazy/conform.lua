return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
        hcl = { "packer_fmt", "terraform_fmt" },
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
