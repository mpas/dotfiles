local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", filetypes = { "python" } },
    { command = "isort", filetypes = { "python" } },
}


-- https://bhupesh.me/writing-like-a-pro-with-vale-and-neovim/

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "vale", filetypes = { "markdown" } },
    { command = "flake8", filetypes = { "python" } },
    { command = "codespell" },
    { command = "misspell", filetypes = { "tex", "markdown" } }
}
