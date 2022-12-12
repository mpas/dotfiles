lvim.plugins = {
    --------------------------------------------------------------------------------
    -- General
    --------------------------------------------------------------------------------
    --
    { "stevearc/dressing.nvim" },

    -- Pick icons
    { "ziontee113/icon-picker.nvim",
        config = function()
            require("icon-picker").setup({
                disable_legacy_commands = true
            })
        end
    },
    -- Color highlighter
    { "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    -- Distraction-free coding for Neovim
    { "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({
                window = {
                    width = .50
                }
            })
        end,
    },
    -- Draw ascii diagrams
    { "jbyuki/venn.nvim" },

    -- Clipboard manager for neovim
    { "AckslD/nvim-neoclip.lua",
        requires = {
            { 'kkharji/sqlite.lua', module = 'sqlite' },
            -- you'll need at least one of these
            { 'nvim-telescope/telescope.nvim' },
            -- {'ibhagwan/fzf-lua'},
        },
        config = function()
            require('neoclip').setup()
        end,
    },

    -- Paste image from clipboard
    { "ekickx/clipboard-image.nvim" },

    -- Different colorschemes
    { "EdenEast/nightfox.nvim" },
    { "aktersnurra/no-clown-fiesta.nvim" },
    { "marko-cerovac/material.nvim" },
    { "rebelot/kanagawa.nvim" },
    { "catppuccin/nvim" },
    { "rose-pine/neovim" },
    { "projekt0n/github-nvim-theme" },
    { "sainnhe/everforest" },
    { "Mofiqul/vscode.nvim" },
    { "bluz71/vim-nightfly-colors" },
    { "embark-theme/vim" },
    { "mhartington/oceanic-next" },
    { "sainnhe/sonokai" },
    { "Yagua/nebulous.nvim" },

    { "mfussenegger/nvim-lint",
        config = function()
            require('lint').linters_by_ft = {
                markdown = { 'vale', }
            }
        end,
    },

    --------------------------------------------------------------------------------
    -- Editor
    --------------------------------------------------------------------------------
    -- Editor config
    { "gpanders/editorconfig.nvim" },

    -- Allows toggling bookmarks per line
    { "MattesGroeger/vim-bookmarks" },

    -- Mappings to delete, change and add surroundings
    { "tpope/vim-surround",
        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },

    --------------------------------------------------------------------------------
    -- Note taking
    --------------------------------------------------------------------------------
    -- Note taking
    { "mickael-menu/zk-nvim",
        config = function()
            require("zk").setup({
                picker = "telescope",
                lsp = {
                    -- `config` is passed to `vim.lsp.start_client(config)`
                    config = {
                        cmd = { "zk", "lsp" },
                        name = "zk",
                        -- on_attach = ...
                        -- etc, see `a:h vim.lsp.start_client()`
                    },

                    -- automatically attach buffers in a zk notebook that match the given filetypes
                    auto_attach = {
                        enabled = true,
                        filetypes = { "markdown" },
                    },
                },
            })
        end,
    },

    --------------------------------------------------------------------------------
    -- Code runners
    --------------------------------------------------------------------------------
    -- Interactive scratchpad for hackers
    { "metakirby5/codi.vim",
        cmd = "Codi",
    },

    -- Interactive environment for evaluating code within your running program
    { "Olical/conjure" },

    -- Code runner plugin
    { "michaelb/sniprun",
        run = "bash ./install.sh",
        config = function()
            require("sniprun").setup({
                display = {
                    "Terminal",
                    "VirtualText"
                },
                -- display_options = {
                --     terminal_width = 45,
                -- },
                selected_interpreters = {
                    "Python3_fifo"
                },
                repl_enable = {
                    "Python3_original",
                    "Python3_fifo",
                },
            })
        end
    },

    --------------------------------------------------------------------------------
    -- Navigation
    --------------------------------------------------------------------------------
    -- Search and replace
    { "windwp/nvim-spectre",
        event = "BufRead",
        config = function()
            require("spectre").setup()
        end,
    },

    -- Jump to the line
    { "nacro90/numb.nvim",
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
            }
        end,
    },

    -- General-purpose motion plugin
    { "ggandor/leap.nvim",
        config = function()
            require('leap').add_default_mappings()
        end,
    },

    -- Open url with gx
    { "felipec/vim-sanegx",
        event = "BufRead",
    },

    --------------------------------------------------------------------------------
    -- Development and debugging
    --------------------------------------------------------------------------------
    -- Add virtual text support to nvim-dap
    { "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup({})
        end,
    },

    -- An extension for nvim-dap providing default configurations for python
    { "mfussenegger/nvim-dap-python" },

    -- Tiny plugin to quickly switch python virtual environments from within neovim without restarting.
    { "AckslD/swenv.nvim",
        config = function()
            require('swenv').setup({
                -- Path passed to `get_venvs`.
                venvs_path = vim.fn.expand('/usr/local/Caskroom/mambaforge/base/envs'),

            })
        end,
    },

    -- Generate docstrings automatically.
    { "danymat/neogen",
        config = function()
            require('neogen').setup({
                snippet_engine = "luasnip",
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
    },

    --------------------------------------------------------------------------------
    -- Lsp enhancements
    --------------------------------------------------------------------------------
    -- Diagnostics, references, telescope results, quickfix and location lists
    { "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },

    -- Hint when you type
    { "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach() end,
    },

    -- Adds vscode-like pictograms to neovim built-in lsp
    { "onsails/lspkind.nvim",
        -- config = function()
        --     require("lspkind").setup({})
        -- end,
    },

    -- A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI
    { "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").init_lsp_saga({
                show_outline = {
                    jump_key = '<cr>',
                }
            })
        end,
    },

    -- Handy pop-up menu for code actions
    { "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu"
    },

    --------------------------------------------------------------------------------
    -- Treesitter
    --------------------------------------------------------------------------------
    -- Rainbow parentheses
    { "p00f/nvim-ts-rainbow" },

    -- Autoclose and autorename html tags
    { "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },

    --------------------------------------------------------------------------------
    -- Telescope
    --------------------------------------------------------------------------------
    -- Telescope extensions
    { "tom-anders/telescope-vim-bookmarks.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "rudism/telescope-dict.nvim" },
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
    { "TimUntersberger/neogit" },

    -- Edit and review GitHub issues and pull requests
    { "pwntester/octo.nvim",
        config = function()
            require('octo').setup({})
        end,
        event = "BufRead",
    },

    -- Git diff in a single tabpage
    { "sindrets/diffview.nvim",
        event = "BufRead",
    },

    -- Create/edit Github gists
    { "mattn/vim-gist",
        event = "BufRead",
        requires = "mattn/webapi-vim",
    },

    -- Generate shareable file permalinks for several git web frontend hosts
    { "ruifm/gitlinker.nvim",
        event = "BufRead",
        config = function()
            require("gitlinker").setup {
                opts = {
                    -- callback for what to do with the url
                    action_callback = require("gitlinker.actions").open_in_browser,
                },
            }
        end,
        requires = "nvim-lua/plenary.nvim",
    },

    --------------------------------------------------------------------------------
    -- Markdown
    --------------------------------------------------------------------------------
    -- Fluent navigation of documents and notebooks (AKA "wikis") written in markdown
    { "jakewvincent/mkdnflow.nvim",
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
    },

    --- Preview markdown on your modern browser with synchronised scrolling and flexible configuration
    { "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    -- A markdown preview directly in your neovim
    { "npxbr/glow.nvim",
        ft = { "markdown" }
    },
}
