return {
  {
    -- Edit and review GitHub issues and pull requests
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        enable_builtin = true, -- shows a list of builtin actions when no action is provided
      })
    end,
    event = "BufRead",
    keys = {
      { "<leader>o", "<cmd>Octo<cr>", "Octo" },
    },
  },
}
