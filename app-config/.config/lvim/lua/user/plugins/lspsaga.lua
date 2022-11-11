-- A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI.
return { "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require("lspsaga").init_lsp_saga({
            show_outline = {
                jump_key = '<cr>',
            }
        })
    end,
}
