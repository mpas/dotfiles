-- Edit and review GitHub issues and pull requests
return { "pwntester/octo.nvim",
    config = function()
        require('octo').setup({})
    end,
    event = "BufRead",
}
