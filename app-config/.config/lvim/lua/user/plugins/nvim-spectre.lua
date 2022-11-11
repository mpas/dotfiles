-- Search and replace
return { "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
        require("spectre").setup()
    end,
}
