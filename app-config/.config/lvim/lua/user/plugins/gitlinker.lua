-- Generate shareable file permalinks for several git web frontend hosts
return { "ruifm/gitlinker.nvim",
    event = "BufRead",
    config = function()
        require("gitlinker").setup {
            opts = {
                -- callback for what to do with the url
                action_callback = require("gitlinker.actions").open_in_browser,
            },
        }
    end,
    requires = "nvim-lua/plenary.nvim",
}
