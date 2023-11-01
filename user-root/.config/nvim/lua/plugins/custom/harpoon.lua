return {
  -- Getting you where you want with the fewest keystrokes
  "ThePrimeagen/harpoon",
  config = function()
    require("harpoon").setup({
      global_settings = {
        save_on_toggle = true,
        enter_on_sendcmd = true,
      },
    })
    require("telescope").load_extension("harpoon")
  end,
}
