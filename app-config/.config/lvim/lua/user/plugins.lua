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

    -- Color highlightener
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

    -- An asynchronous linter plugin for Neovim
    { "mfussenegger/nvim-lint",
        config = function()
            require('lint').linters_by_ft = {
                markdown = { 'vale', }
            }
        end,
    },

    { "dhruvasagar/vim-zoom" },

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

    -- Undotree visualizes the undo history
    { "mbbill/undotree" },

    -- Make Neovim's fold look modern and keep high performance
    { "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async",
        config = function()
            require('ufo').setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { 'treesitter', 'indent' }
                end
            })
        end
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

    { "dccsillag/magma-nvim",
        run = ":UpdateRemotePlugins",
        -- config = function()
        --     require('magma-nvim')
        -- end
    },

    -- Code runner plugin
    -- { "michaelb/sniprun",
    --     run = "bash ./install.sh",
    --     config = function()
    --         require("sniprun").setup({
    --             display = {
    --                 "Terminal",
    --                 "VirtualText"
    --             },
    --             -- display_options = {
    --             --     terminal_width = 45,
    --             -- },
    --             selected_interpreters = {
    --                 "Python3_fifo"
    --             },
    --             repl_enable = {
    --                 "Python3_original",
    --                 "Python3_fifo",
    --             },
    --         })
    --     end
    -- },

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

    -- Better quickfix window
    { "kevinhwang91/nvim-bqf",
        event = { "BufRead", "BufNew" },
        config = function()
            require("bqf").setup({
                auto_enable = true,
                preview = {
                    win_height = 12,
                    win_vheight = 12,
                    delay_syntax = 80,
                    border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
                },
                func_map = {
                    vsplit = "",
                    ptogglemode = "z,",
                    stoggleup = "",
                },
                filter = {
                    fzf = {
                        action_for = { ["ctrl-s"] = "split" },
                        extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                    },
                },
            })
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

    -- Getting you where you want with the fewest keystrokes
    { "ThePrimeagen/harpoon",
        config = function()
            require("harpoon").setup {
                global_settings = {
                    save_on_toggle = true,
                    enter_on_sendcmd = true,
                },
            }
            require("telescope").load_extension("harpoon")
        end,
    },

    --------------------------------------------------------------------------------
    -- Development and debugging
    --------------------------------------------------------------------------------
    { "ThePrimeagen/refactoring.nvim",
        config = function()
            require('refactoring').setup({})
        end,
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        }
    },

    { "jbyuki/one-small-step-for-vimkind" },

    { "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup({
                symbols = {
                    File = { hl = "@text.uri" },
                    Module = { hl = "@namespace" },
                    Namespace = { hl = "@namespace" },
                    Package = { hl = "@namespace" },
                    Class = { hl = "@type" },
                    Method = { hl = "@method" },
                    Property = { hl = "@method" },
                    Field = { hl = "@field" },
                    Constructor = { hl = "@constructor" },
                    Enum = { hl = "@type" },
                    Interface = { hl = "@type" },
                    Function = { hl = "@function" },
                    Variable = { hl = "@constant" },
                    Constant = { hl = "@constant" },
                    String = { hl = "@string" },
                    Number = { hl = "@number" },
                    Boolean = { hl = "@boolean" },
                    Array = { hl = "@constant" },
                    Object = { hl = "@type" },
                    Key = { hl = "@type" },
                    Null = { hl = "@type" },
                    EnumMember = { hl = "@field" },
                    Struct = { hl = "@type" },
                    Event = { hl = "@type" },
                    Operator = { hl = "@operator" },
                    TypeParameter = { hl = "@parameter" },
                },
            })
        end,
    },

    -- Add virtual text support to nvim-dap
    { "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup({})
        end,
    },

    -- An extension for nvim-dap providing default configurations for python
    { "mfussenegger/nvim-dap-python" },

    -- Tiny plugin to quickly switch python virtual environments from within neovim without restarting.
    -- { "AckslD/swenv.nvim",
    --     config = function()
    --         require('swenv').setup({
    --             -- Path passed to `get_venvs`.
    --             venvs_path = vim.fn.expand('/usr/local/Caskroom/mambaforge/base/envs'),

    --         })
    --     end,
    -- },

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
            require('lspsaga').setup({})
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
    --- An awesome automatic table creator & formatter
    { "dhruvasagar/vim-table-mode" },

    -- Fluent navigation of documents and notebooks (AKA "wikis") written in markdown
    -- { "jakewvincent/mkdnflow.nvim",
    --     config = function()
    --         require('mkdnflow').setup({
    --             mappings = {
    --             --     MkdnEnter = { { 'i', 'n', 'v' }, '<CR>' },
    --             --     MkdnNextLink = { 'n', '<TAB-l>' },
    --             --     MkdnPrevLink = { 'n', '<TAB-h' },
    --               MkdnTab = true,
    --               MkdnSTab= true,
    --             },
    --             -- links = {
    --             --     conceal = true,
    --             -- },
    --             -- silent = true,
    --         })
    --     end
    -- },

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
