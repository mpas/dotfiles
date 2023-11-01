return {
  -- Paste image from clipboard into relatives images folder
  "ekickx/clipboard-image.nvim",
  config = function()
    require("clipboard-image").setup({
      -- see https://github.com/ekickx/clipboard-image.nvim/discussions/15#discussioncomment-1953898
      default = {
        img_dir = { "%:p:h", "images", "%:t:r" },
      },
    })
  end,
}
