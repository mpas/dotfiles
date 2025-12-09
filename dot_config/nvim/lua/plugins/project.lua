return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false,
      show_hidden = true,
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".project.nvim" },
      datapath = vim.fn.stdpath("data"),
    },
  },
}
