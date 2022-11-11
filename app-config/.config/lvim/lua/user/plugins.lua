lvim.plugins = {
    --------------------------------------------------------------------------------
    -- General
    --------------------------------------------------------------------------------
    -- Pick icons
    require "user.plugins.icon-picker",

    -- Color highlighter
    require "user.plugins.nvim-colorizer",

    -- Distraction-free coding for Neovim
    require "user.plugins.zen-mode",

    -- Draw ascii diagrams
    require "user.plugins.venn",

    -- Clipboard manager for neovim
    require "user.plugins.nvim-neoclip",

    -- Paste image from clipboard
    require "user.plugins.clipboard-image",

    --------------------------------------------------------------------------------
    -- Editor
    --------------------------------------------------------------------------------
    -- Editor config
    require "user.plugins.editorconfig",

    -- Allows toggling bookmarks per line
    require "user.plugins.vim-bookmarks",

    -- Mappings to delete, change and add surroundings
    require "user.plugins.vim-surround",

    --------------------------------------------------------------------------------
    -- Note taking
    --------------------------------------------------------------------------------
    -- Note taking
    require "user.plugins.zk-nvim",

    --------------------------------------------------------------------------------
    -- Code runners
    --------------------------------------------------------------------------------
    -- Interactive scratchpad for hackers
    require "user.plugins.codi",

    -- Interactive environment for evaluating code within your running program
    require "user.plugins.conjure",

    -- Code runner plugin
    require "user.plugins.sniprun",

    --------------------------------------------------------------------------------
    -- Navigation
    --------------------------------------------------------------------------------
    -- Search and replace
    require "user.plugins.nvim-spectre",

    -- Jump to the line
    require "user.plugins.numb",

    -- General-purpose motion plugin
    require "user.plugins.leap",

    -- Open url with gx
    require "user.plugins.vim-sanegx",

    --------------------------------------------------------------------------------
    -- Development and debugging
    --------------------------------------------------------------------------------
    -- Add virtual text support to nvim-dap
    require "user.plugins.nvim-dap-virtual-text",

    -- An extension for nvim-dap providing default configurations for python
    require "user.plugins.nvim-dap-python",

    -- Tiny plugin to quickly switch python virtual environments from within neovim without restarting.
    require "user.plugins.swenv",

    -- Generate docstrings automatically.
    require "user.plugins.neogen",

    --------------------------------------------------------------------------------
    -- Lsp enhancements
    --------------------------------------------------------------------------------
    -- Diagnostics, references, telescope results, quickfix and location lists
    require "user.plugins.trouble",

    -- Hint when you type
    require "user.plugins.lsp-signature",

    -- Adds vscode-like pictograms to neovim built-in lsp
    require "user.plugins.lsp-kind",

    -- A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI
    require "user.plugins.lspsaga",

    -- Handy pop-up menu for code actions
    require "user.plugins.nvim-code-action-menu",

    --------------------------------------------------------------------------------
    -- Treesitter
    --------------------------------------------------------------------------------
    -- Rainbow parentheses
    require "user.plugins.nvim-ts-rainbow",

    -- Autoclose and autorename html tags
    require "user.plugins.nvim-ts-autotag",

    --------------------------------------------------------------------------------
    -- Telescope
    --------------------------------------------------------------------------------
    -- Telescope extensions
    { "tom-anders/telescope-vim-bookmarks.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-project.nvim",
        event = "BufWinEnter",
        setup = function()
            vim.cmd [[packadd telescope.nvim]]
        end,
    },

    --------------------------------------------------------------------------------
    -- Git
    --------------------------------------------------------------------------------
    -- A work-in-progress Magit clone for Neovim
    require "user.plugins.neogit",

    -- Edit and review GitHub issues and pull requests
    require "user.plugins.octo",

    -- Git diff in a single tabpage
    require "user.plugins.diffview",

    -- Create/edit Github gists
    require "user.plugins.vim-gists",

    -- Generate shareable file permalinks for several git web frontend hosts
    require "user.plugins.gitlinker",

    --------------------------------------------------------------------------------
    -- Markdown
    --------------------------------------------------------------------------------
    -- Fluent navigation of documents and notebooks (AKA "wikis") written in markdown
    require "user.plugins.mkdnflow",

    --- Preview markdown on your modern browser with synchronised scrolling and flexible configuration
    require "user.plugins.markdown-preview",

    -- A markdown preview directly in your neovim
    require "user.plugins.glow",

    -- Automatic table creator & formatter
    require "user.plugins.vim-table-mode",
}
