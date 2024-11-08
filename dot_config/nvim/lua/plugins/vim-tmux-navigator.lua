return {
  -- Navigate seamlessly between vim and tmux splits using a consistent set of hotkeys
  "christoomey/vim-tmux-navigator",
  enable = true,
  event = "VeryLazy",
  keys = {
    { "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
  },
}
