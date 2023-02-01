vim.opt.conceallevel = 2
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.spelllang = "en_us,nl"
vim.opt.spell = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.relativenumber = true
lvim.builtin.cmp.cmdline.enable = true

-- vim.opt.foldmethod = "expr" -- folding set to "expr" for treesitter based folding
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

lvim.reload_config_on_save = false
lvim.format_on_save.enabled = true
lvim.log.level = "warn"
-- lvim.colorscheme = "nightfox"
lvim.colorscheme = "nightfly"
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
lvim.builtin.cmp.completion.keyword_length = 2
lvim.builtin.telescope.defaults.layout_config.width = 0.95
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 75

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

vim.g.table_mode_corner = '|'

lvim.format_on_save.timeout = 5000
lvim.builtin.which_key.setup.plugins.presets.z = true
