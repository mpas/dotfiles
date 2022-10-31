-- general
lvim.colorscheme = "onedarker"
lvim.format_on_save = true
lvim.log.level = "warn"

vim.opt.conceallevel = 1
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- keymapping
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<F2>"] = "<cmd>Lspsaga rename<cr>"
-- lvim.keys.normal_mode["<f5>"] = ":lua require('dap').continue()<CR>"

-- lvim.keys.visual_mode["<C-r>"] = ":lua require('spectre').open_visual({select_word=true})<cr>"
-- -- lvim.keys.normal_mode["<f8>"] = ":lua require('dapui').toggle()<CR>"
-- -- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.dap.active = true

-- if you don't want all the parsers change this to a table of the ones you want
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

-- Treesitter config settings
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }


pcall(
    function()
        require("dap-python").setup()
    end
)

lvim.builtin.project.patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".project.nvim" }

-- require("project_nvim").setup({
--   -- All the patterns used to detect root dir, when **"pattern"** is in
--   -- detection_methods
--   patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".project.nvim" },
-- })

-- Additional Plugins
lvim.plugins = {
    --------------------------------------------------------------------------------
    -- Navigation
    --------------------------------------------------------------------------------
    -- General-purpose motion plugin
    { "ggandor/leap.nvim", config = function() require('leap').add_default_mappings() end },

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

    -- Search and replace
    {
        "windwp/nvim-spectre",
        event = "BufRead",
        config = function()
            require("spectre").setup()
        end,
    },

    --------------------------------------------------------------------------------
    -- General
    --------------------------------------------------------------------------------
    -- Editor config
    { "gpanders/editorconfig.nvim" },

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

    -- Distraction-free coding for Neovim
    { "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({
                window = {
                    width = .75
                }
            })
        end
    },

    -- Color highlighter
    { "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },
    -- Highlight and search for todo comments
    -- { "folke/todo-comments.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("todo-comments").setup()
    --   end,
    -- },

    -- Interactive scratchpad for hackers
    { "metakirby5/codi.vim",
        cmd = "Codi",
    },


    -- open url with gx
    { "felipec/vim-sanegx",
        event = "BufRead",
    },

    -- Mappings to delete, change and add surroundings
    { "tpope/vim-surround",
        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },

    -- Allows toggling bookmarks per line
    { "MattesGroeger/vim-bookmarks" },

    --------------------------------------------------------------------------------
    -- Debugging
    --------------------------------------------------------------------------------
    -- Add virtual text support to nvim-dap
    { "theHamsta/nvim-dap-virtual-text",
        config = function() require("nvim-dap-virtual-text").setup({}) end
    },

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

    --------------------------------------------------------------------------------
    -- Org mode
    --------------------------------------------------------------------------------
    { "nvim-orgmode/orgmode",
        config = function()
            require("orgmode").setup_ts_grammar()
            require("orgmode").setup({
                org_agenda_files = { "~/Dropbox/notes/*.org" },
                org_default_notes_file = "~/Dropbox/notes/inbox.org",
                org_todo_keywords = { "TODO(t)", "DOING", "WAITING", "|", "DONE", "CANCELLED" },
                org_archive_location = { "~/Dropbox/notes/inbox_archive.org" },
                org_blank_before_new_entry = { heading = false },
                org_capture_templates = {
                    t = {
                        description = "TODO",
                        template = "** TODO %?\n %u",
                        target = "~/Dropbox/notes/inbox.org",
                        headline = "Inbox",
                    },
                    e = 'Event',
                    er = {
                        description = 'recurring',
                        template = '** %?\n %T',
                        target = '~/Dropbox/notes/calendar.org',
                        headline = 'Recurring'
                    },
                    eo = {
                        description = 'one-time',
                        template = '** %?\n %T',
                        target = '~/Dropbox/notes/calendar.org',
                        headline = 'One-time'
                    }
                },
            })
        end,
    },

    -- Automatic table creator & formatter
    { "dhruvasagar/vim-table-mode" },

    --------------------------------------------------------------------------------
    -- Lsp enhancements
    --------------------------------------------------------------------------------
    -- Tree like view for symbols
    { "simrat39/symbols-outline.nvim",
        config = function()
            require('symbols-outline').setup()
        end
    },

    -- Diagnostics, references, telescope results, quickfix and location lists
    { "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },

    -- Hint when you type
    { "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach() end,
    },

    { "onsails/lspkind.nvim",
        -- config = function()
        --     require("lspkind").setup({})
        -- end,
    },

    { "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").init_lsp_saga({
                -- your configuration
            })
        end,
    },

    --------------------------------------------------------------------------------
    -- Treesitter
    --------------------------------------------------------------------------------
    -- Autoclose and autorename html tags
    { "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },

    -- Rainbow parentheses
    { "p00f/nvim-ts-rainbow" },

    -- view treesitter information
    { "nvim-treesitter/playground",
        event = "BufRead",
        config = function()
            require("nvim-treesitter.configs").setup({
                playground = {
                    enable = true,
                    disable = {},
                    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                    persist_queries = false, -- Whether the query persists across vim sessions
                    keybindings = {
                        toggle_query_editor = 'o',
                        toggle_hl_groups = 'i',
                        toggle_injected_languages = 't',
                        toggle_anonymous_nodes = 'a',
                        toggle_language_display = 'I',
                        focus_language = 'f',
                        unfocus_language = 'F',
                        update = 'R',
                        goto_node = '<cr>',
                        show_help = '?',
                    },
                }
            })
        end
    },

    --------------------------------------------------------------------------------
    -- Telescope extensions
    --------------------------------------------------------------------------------
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
    -- Simple clone of the plugin vim-fugitive
    { "dinhhuy258/git.nvim",
        config = function()
            require("git").setup({})
        end,
    },

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
        event = "BufRead"
    },

    -- Create/edit Github gists
    -- { "mattn/vim-gist",
    --     event = "BufRead",
    --     requires = "mattn/webapi-vim",
    -- },

    -- Generate shareable file permalinks for several git web frontend hosts
    { "ruifm/gitlinker.nvim",
        event = "BufRead",
        config = function()
            require("gitlinker").setup {
                opts = {
                    -- remote = 'github', -- force the use of a specific remote
                    -- adds current line nr in the url for normal mode
                    add_current_line_on_normal_mode = true,
                    -- callback for what to do with the url
                    action_callback = require("gitlinker.actions").open_in_browser,
                    -- print the url after performing the action
                    print_url = false,
                    -- mapping to call url generation
                    mappings = "<leader>gy",
                },
            }
        end,
        requires = "nvim-lua/plenary.nvim",
    },
    -- { "mfussenegger/nvim-dap-python" },
    -- { "nvim-telescope/telescope-dap.nvim" },
    -- { "rcarriga/nvim-dap-ui",
    --   config = function()
    --     require("dapui").setup()
    --   end },

    --------------------------------------------------------------------------------
    -- Markdown
    --------------------------------------------------------------------------------
    -- Fluent navigation of documents and notebooks (AKA "wikis") written in markdown
    { "jakewvincent/mkdnflow.nvim",
        config = function()
            require('mkdnflow').setup({
                mappings = {
                    MkdnEnter = { { 'i', 'n', 'v' }, '<CR>' },
                },
                links = {
                    conceal = true,
                },
            })
        end
    },

    --- Preview markdown on your modern browser with synchronised scrolling and flexible configuration
    { "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    { "npxbr/glow.nvim",
        ft = { "markdown" }
    },

    -- Follow markdown links by pressing enter
    -- { "jghauser/follow-md-links.nvim" },

    -- { "godlygeek/tabular" },
    -- { "preservim/vim-markdown" },
    -- { "SidOfc/mkdx" },


    { 'ziontee113/icon-picker.nvim',
        requires = { 'stevearc/dressing.nvim' },
        config = function()
            require("icon-picker").setup({
                disable_legacy_commands = true
            })
        end },
}

-- require("telescope").setup({
-- --     -- extensions = {
-- --     --     file_browser = {
-- --     --       theme = "ivy",
-- --     --     -- disables netrw and use telescope-file-browser in its place
-- --     --       hijack_netrw = true,
-- --     --     },
-- --     -- },
-- )}

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

--------------------------------------------------------------------------------
-- Keymappings
--------------------------------------------------------------------------------
local t = require('telescope.builtin')

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.builtin.which_key.mappings = {
    [";"] = { "<cmd>Alpha<CR>", "Dashboard" },
    ["w"] = { "<cmd>w!<CR>", "Save" },
    ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
    ["c"] = { "<cmd>BufferKill<CR>", "Close Buffer" },
    ["e"] = { "<cmd>lua require'core.nvimtree'.toggle_tree()<CR>", "Explorer" },
    ["h"] = { '<cmd>let @/=""<CR>', "No Highlight" },

    -- buffers
    b = {
        name = "+buffers",
        j = { "<cmd>BufferLinePick<cr>", "Jump" },
        f = { "<cmd>Telescope buffers<cr>", "Find" },
        b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
        n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
        e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close", },
        h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
        l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right",
        },
    },

    -- find
    f = {
        name = "+find",
        b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
        B = { "<cmd>Telescope vim_bookmarks<cr>", "Find Bookmark" },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        w = { "<cmd>Telescope grep_string()<CR>", "word" },
        s = { "<cmd>Telescope lsp_document_symbols()<CR>", "document symbols" },
        S = { "<cmd>Telescope lsp_workspace_symbols()<CR>", "workspace symbols" },
        q = { "<cmd>Telescope quickfix()<CR>", "in quickfix list" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        c = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
            "Colorscheme with Preview", },
        x = { "<cmd>lua require('spectre').open_visual()()<cr>", "Replace" },
        n = { "<cmd>nvimtreefindfile<cr>", "find current file in tree" },
        p = { "<cmd>Telescope projects<cr>", "Find Project" },
    },

    -- git
    g = {
        name = "Git",
        c = {
            name = "+gitclient",
            g = { "<cmd>Neogit<cr>", "Neogit" },
            l = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
        },
        i = {
            name = "+issue",
            l = { "<cmd>Octo issue list<cr>", "List" },
            c = { "<cmd>Octo issue create<cr>", "Create" },
        },
        p = {
            name = "+pull-request",
            l = { "<cmd>Octo pr list<cr>", "List" },
            c = { "<cmd>Octo pr create<cr>", "Create" },
        },
    },

    -- insert stuff
    i = {
        name = "+insert",
        i = { "<cmd>IconPickerNormal<cr>", "Icon" },
    },

    -- lunarvim
    L = {
        name = "+lunarvim",
        c = { "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>", "Edit config.lua", },
        k = { "<cmd>Telescope keymaps<cr>", "View LunarVim's keymappings" },
        i = {
            "<cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<cr>",
            "Toggle LunarVim Info",
        },
        n = { "<cmd>Telescope notify<cr>", "View Notifications" },
        r = { "<cmd>LvimReload<cr>", "Reload LunarVim's configuration" },
        u = { "<cmd>LvimUpdate<cr>", "Update LunarVim" },
    },

    -- notes
    n = {
        name = "+notes",
        n = { "<cmd>ZkNew { title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: ') }<cr>", "New" },
        v = { "With visual selection" },
        vc = { ":'<,'>ZkNewFromContentSelection { title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: ') }<cr>",
            "With content from selection" },
        vt = { ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.input('Dir: ') }<cr>", "With title from selection" },
        i = { "<cmd>ZkIndex { force = true }<cr>", "Index" },
        b = { "<cmd>ZkNotes { sort = { 'modified' } }<cr>", "Browse" },
        l = { "Links" },
        li = { "<cmd>ZkBacklinks<cr>", "Inbound (Backlinks)" },
        lo = { "<cmd>ZkLinks<cr>", "Outbound" },
        s = { "Search" },
        st = { "<cmd>ZkNotes { sort = { 'modified' } }<cr>", "Title" },
        sT = { "<cmd>ZkTags<cr>", "Tags" },
        sc = { "<cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<cr>", "Content" },
        qsv = { ":'<,'>ZkMatch<cr>", "Visual selection" },
    },

    -- org mode
    o = {
        name = "+org",
        i = { ":e ~/Dropbox/notes/inbox.org<cr>", "open inbox" },
    },

    -- packer
    p = {
        name = "+packer",
        c = { "<cmd>PackerCompile<CR>", "Compile" },
        i = { "<cmd>PackerInstall<CR>", "Install" },
        r = { "<cmd>lua require('lv-utils').reload_lv_config()<CR>", "Reload" },
        s = { "<cmd>PackerSync<CR>", "Sync" },
        u = { "<cmd>PackerUpdate<CR>", "Update" },
    },

    -- quit
    q = {
        name = "+quit",
        w = { "<cmd>q<CR>", "window" },
        W = { "<cmd>wincmd o<CR>", "all other windows" },
        b = { "<cmd>Bdelete<CR>", "buffer" },
        B = { "<cmd>BufOnly!<CR>", "all other buffers" },
        t = { "<cmd>tabclose<CR>", "tab" },
        T = { "<cmd>tabonly<CR>", "all other tabs" },
        q = { "<cmd>cclose<CR>", "quickfix list" },
    },

    -- search
    s = {
        name = "+search",
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        R = { "<cmd>Telescope neoclip<cr>", "Registers" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        p = {
            "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
            "Colorscheme with Preview",
        },
        r = { "<cmd>lua require('spectre').open_visual()<cr>", "Replace" }
    },

    -- toggles
    t = {
        name = "+toggle",
        c = {
            name = "Codi",
            e = { "<cmd>Codi<cr>", "Codi (enable)" },
            d = { "<cmd>Codi!<cr>", "Codi (disable)" },
        },
        m = {
            name = "Markdown",
            p = { "<cmd>MarkdownPreviewToggle<cr>", "Preview" },
            t = { "<cmd>TableModeToggle<cr>", "Table Mode" },
        },
        t = {
            name = "Trouble",
            t = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
            w = { "<cmd>Trouble workspace_diagnostics<cr>", "Diagnostics" },
        },
        z = { "<cmd>ZenMode<cr>", "Zen Mode" },
    },
}



local dap = require("dap")

dap.adapters.python = {
    type = 'executable';
    command = "python";
    args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch';
        name = "Launch file";
        program = "${file}";
    },
}


-- map({ "n", "<F4>", ":lua require('dapui').toggle()<CR>" })
--     -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

--     program = "${file}"; -- This configuration will launch the current file if used.
--     pythonPath = function()
--       -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
--       -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
--       -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
--       local cwd = vim.fn.getcwd()
--       if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
--         return cwd .. '/venv/bin/python'
--       elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
--         return cwd .. '/.venv/bin/python'
--       else
--         return '/usr/bin/python'
--       end
--     end;
--   },
-- }
-- dap.adapters.python = {
--   type = 'executable',
--   command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python',
--   args = { '-m', 'debugpy.adapter' }

-- dap.configurations.python = {
--   {
--     type = "python",
--     request = "launch",
--     name = "Launch file",
--     program = "${file}",
--     pythonPath = function() return "/Users/phnl310301178/.asdf/shims/python" end,
--   },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
