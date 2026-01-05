-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- https://vimdoc.sourceforge.net/htmldoc/quickref.html#option-list
local vim_options = {
  backup = false, -- creates a backup file
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  conceallevel = 2, -- so that `` is visible in markdown files
  cursorcolumn = false,
  cursorline = true, -- highlight the current line
  expandtab = true, -- convert tabs to spaces
  fileencoding = "utf-8", -- the encoding written to a file
  -- foldmethod = "indent",
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  number = true, -- set numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  relativenumber = true, -- set relative numbered lines
  scrolloff = 8, -- determines the number of context lines you would like to see above and below the cursor
  shiftwidth = 4, -- the number of spaces inserted for each indentation
  sidescrolloff = 8, -- the minimal number of screen columns to keep to the left and to the right of the cursor if 'nowrap' is set
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  softtabstop = 4, -- how far the cursur moves when typing Tab
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  tabstop = 4, -- insert spaces for a tab
  mouse = "a", -- allow the mouse to be used in neovim
  spell = true, -- enable spell checking
  spelllang = "en_us,nl", -- language(s) to do spell checking for
  wrap = true, -- long lines wrap and continue on the next line
  linebreak = true, -- wrap long lines at a blank
  winbar = "%=%m %f",
  listchars = {
    tab = "> ",
    trail = "-",
    eol = "↵",
  },
}

for k, v in pairs(vim_options) do
  vim.opt[k] = v
end

local global_options = {
  table_mode_corner = "|",
  maplocalleader = ";",
  markdown_folding = 1,
}

for k, v in pairs(global_options) do
  vim.g[k] = v
end
