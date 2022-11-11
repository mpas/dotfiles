-- Generate docstrings automatically.
return { "danymat/neogen",
    config = function()
        require('neogen').setup({
            enabled = true,
            languages = {
                python = {
                    template = {
                        annotation_convention = "google_docstrings",
                    },
                },
            },
        })
    end,
    requires = "nvim-treesitter/nvim-treesitter",
}
