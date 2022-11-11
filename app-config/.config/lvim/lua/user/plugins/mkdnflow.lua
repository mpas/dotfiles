-- Fluent navigation of documents and notebooks (AKA "wikis") written in markdown
return { "jakewvincent/mkdnflow.nvim",
    config = function()
        require('mkdnflow').setup({
            mappings = {
                MkdnEnter = { { 'i', 'n', 'v' }, '<CR>' },
                MkdnNextLink = { 'n', '<TAB-l>' },
                MkdnPrevLink = { 'n', '<TAB-h' },
            },
            links = {
                conceal = true,
            },
            silent = true,
        })
    end
}
