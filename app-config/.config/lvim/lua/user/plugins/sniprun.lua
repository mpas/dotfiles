-- Code runner plugin
return { "michaelb/sniprun",
    run = "bash ./install.sh",
    config = function()
        require("sniprun").setup({
            display = {
                "Terminal",
                "VirtualText"
            },
            -- display_options = {
            --     terminal_width = 45,
            -- },
            selected_interpreters = {
                "Python3_fifo"
            },
            repl_enable = {
                "Python3_original",
                "Python3_fifo",
            },
        })
    end
}
