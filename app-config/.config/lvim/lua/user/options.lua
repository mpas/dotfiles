vim.opt.conceallevel = 1
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

lvim.reload_config_on_save = false
lvim.format_on_save.enabled = true
lvim.log.level = "warn"
lvim.colorscheme = "lunar"
-- lvim.colorscheme = "onedarker"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.dap.active = true
lvim.builtin.dap.ui.auto_open = true
lvim.builtin.project.patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".project.nvim" }
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
    "hcl",
    "clojure",
    "dockerfile",
    "gitignore",
    "html",
    "org",
    "sql",
    "markdown",
    "markdown_inline",
    "toml",
    "query"
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

require("nvim-treesitter.configs").setup({
    highlight = {
        additional_vim_regex_highlighting = { "markdown", "org" }
    },
})

lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "file_browser")
    pcall(telescope.load_extension, "vim_bookmarks")
    pcall(telescope.load_extension, "project")
    pcall(telescope.load_extension, "neoclip")
end
