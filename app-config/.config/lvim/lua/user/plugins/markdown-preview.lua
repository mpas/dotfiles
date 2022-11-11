--- Preview markdown on your modern browser with synchronised scrolling and flexible configuration
return { "iamcco/markdown-preview.nvim",
    run = function()
        vim.fn["mkdp#util#install"]()
    end,
}
