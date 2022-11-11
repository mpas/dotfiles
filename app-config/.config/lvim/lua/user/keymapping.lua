-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

lvim.builtin.dap.on_config_done = function()
    lvim.builtin.which_key.mappings['d'] = {
        name = "+debug",
        t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
        b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
        c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
        d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
        g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
        o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
        u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
        p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
        s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
        q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
        U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
    }
end

lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
lvim.builtin.which_key.mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
lvim.builtin.which_key.vmappings["d"] = {
    name = "Debug",
    s = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
}


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
vim.g.maplocalleader = ";"

--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------
lvim.keys.insert_mode[";;"] = "<Esc>"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>" -- save

--------------------------------------------------------------------------------
-- BufferLine
--------------------------------------------------------------------------------
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<TAB>"] = "<cmd>BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-TAB>"] = "<cmd>BufferLineCyclePrev<cr>"

--------------------------------------------------------------------------------
-- SnipRun
--------------------------------------------------------------------------------
lvim.keys.visual_mode["<LEADER>r"] = ":SnipRun<cr>"
lvim.keys.normal_mode["<LEADER>r"] = "<cmd>SnipRun<cr>"

--------------------------------------------------------------------------------
-- Lsp / LspSaga
--------------------------------------------------------------------------------
lvim.lsp.buffer_mappings.normal_mode["gh"] = { "<cmd>Lspsaga lsp_finder<cr>", "Find" }
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Lspsaga rename<cr>", "Rename" }
lvim.lsp.buffer_mappings.normal_mode["gd"] = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition" }
lvim.lsp.buffer_mappings.normal_mode["ca"] = { "<cmd>Lspsaga code_action<cr>", "Code action" }
lvim.lsp.buffer_mappings.visual_mode["cd"] = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Line diagnostics" }
lvim.lsp.buffer_mappings.normal_mode["cd"] = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Cursor diagnostics" }
lvim.lsp.buffer_mappings.normal_mode["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>" }
lvim.lsp.buffer_mappings.normal_mode["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>" }
lvim.lsp.buffer_mappings.normal_mode["o"] = { "<cmd>LSoutlineToggle<cr>", "Outline" }
lvim.lsp.buffer_mappings.normal_mode["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Documentation" }

lvim.keys.normal_mode["<F2>"] = ":lua require'dap'.continue()<cr>"
lvim.keys.normal_mode["<F9>"] = ":lua require'dap'.toggle_breakpoint()<cr>"


local function open_inbox(inbox_name)
    require("zk.commands").get("ZkNew")({ title = inbox_name, dir = "" })
    vim.wait(100)
    vim.fn.feedkeys("G$a")
end

-- remove all keybindings from whichkey and add our own
lvim.builtin.which_key.mappings = {
    ["c"] = { "<cmd>BufferKill<cr>", "Close Buffer" },
    ["e"] = { "<cmd>lua require'core.nvimtree'.toggle_tree()<cr>", "Explorer" },
    ["h"] = { '<cmd>let @/=""<cr>', "No Highlight" },

    -- buffers
    b = {
        name = "+buffers",
        j = { "<cmd>BufferLinePick<cr>", "Jump" },
        f = { "<cmd>Telescope buffers<cr>", "Find" },
        b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
        n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
        e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close", },
        h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
        l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
        D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
        L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language" },
    },

    -- debug (needs to be in a function see https://github.com/LunarVim/LunarVim/issues/3456)
    -- d = { },

    -- find
    f = {
        name = "+find",
        b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
        B = { "<cmd>Telescope vim_bookmarks<cr>", "Find Bookmark" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        c = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
            "Colorscheme with Preview", },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        n = { "<cmd>nvimtreefindfile<cr>", "find current file in tree" },
        p = { "<cmd>Telescope projects<cr>", "Find Project" },
        R = { "<cmd>Telescope neoclip<cr>", "Registers" },
        q = { "<cmd>Telescope quickfix()<CR>", "in quickfix list" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        s = { "<cmd>Telescope lsp_document_symbols()<CR>", "document symbols" },
        S = { "<cmd>Telescope lsp_workspace_symbols()<CR>", "workspace symbols" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        w = { "<cmd>Telescope grep_string()<CR>", "word" },
        x = { "<cmd>lua require('spectre').open_visual()<cr>", "Replace" }
    },

    -- git
    g = {
        name = "+git",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff", },
        c = {
            name = "+gitclient",
            n = { "<cmd>Neogit<cr>", "Neogit" },
            l = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
        },
        i = {
            name = "+issue",
            l = { "<cmd>Octo issue list<cr>", "List" },
            c = { "<cmd>Octo issue create<cr>", "Create" },
        },
        s = { "<cmd>Telescope git_status<cr>", "Open changed file" },
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
        t = { "<cmd>ZkNew { title = 'inbox', dir = '' }<cr>", "Todo" },
    },

    -- lsp
    l = {
        name = "+lsp",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
        w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
        f = { require("lvim.lsp.utils").format, "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>Mason<cr>", "Mason Info" },
        j = {
            vim.diagnostic.goto_next,
            "Next Diagnostic",
        },
        k = {
            vim.diagnostic.goto_prev,
            "Prev Diagnostic",
        },
        l = { vim.lsp.codelens.run, "CodeLens Action" },
        q = { vim.diagnostic.setloclist, "Quickfix" },
        r = { vim.lsp.buf.rename, "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols",
        },
        e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
    },

    -- lunarvim
    L = {
        name = "+lunarvim",
        c = { "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>", "Edit config.lua", },
        d = { "<cmd>LvimDocs<cr>", "View LunarVim's docs" },
        f = { "<cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<cr>", "Find LunarVim files", },
        g = { "<cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<cr>", "Grep LunarVim files", },
        k = { "<cmd>Telescope keymaps<cr>", "View LunarVim's keymappings" },
        i = { "<cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<cr>", "Toggle LunarVim Info", },
        I = { "<cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<cr>",
            "View LunarVim's changelog", },
        l = {
            name = "+logs",
            d = { "<cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())<cr>",
                "view default log", },
            D = { "<cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<cr>",
                "Open the default logfile", },
            l = { "<cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())<cr>", "view lsp log", },
            L = { "<cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<cr>", "Open the LSP logfile" },
            n = { "<cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<cr>",
                "view neovim log", },
            N = { "<cmd>edit $NVIM_LOG_FILE<cr>", "Open the Neovim logfile" },
            p = { "<cmd>lua require('lvim.core.terminal').toggle_log_view(get_cache_dir() .. '/packer.nvim.log')<cr>",
                "view packer log", },
            P = { "<cmd>edit $LUNARVIM_CACHE_DIR/packer.nvim.log<cr>", "Open the Packer logfile" },
        },
        r = { "<cmd>LvimReload<cr>", "Reload LunarVim's configuration" },
        u = { "<cmd>LvimUpdate<cr>", "Update LunarVim" },
    },

    -- notes
    n = {
        name = "+notes",
        t = { function()
            require("zk.commands").get("ZkNew")({ title = "inbox", dir = "" })
            vim.wait(100)
            vim.fn.feedkeys("G$a")
        end, "Inbox"
        },
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

    -- python
    P = {
        name = "+python",
        i = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Pick Env" },
        d = { "<cmd>lua require('swenv.api').get_current_venv()<cr>", "Show Env" },
    },

    -- packer
    p = {
        name = "+packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        r = { "<cmd>lua require('lv-utils').reload_lv_config()<cr>", "Reload" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
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
            name = "+trouble",
            t = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
            d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
            w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
            r = { "<cmd>Trouble lsp_references<cr>", "References" },
            f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
            q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
            l = { "<cmd>Trouble loclist<cr>", "LocationList" },
        },
        z = { "<cmd>ZenMode<cr>", "Zen Mode" },
        v = { ":lua Toggle_venn()<CR>", "Venn" },
    },

    x = {
        name = "test",
        t = { function()
            require("zk.commands").get("ZkNew")({ title = "inbox", dir = "" })
            vim.wait(100)
            vim.fn.feedkeys("G$a")
        end, "Inbox"
        },
        -- t = { "<cmd>ZkNew { title = 'inbox', dir = '' }<cr><cmd><S-g><cr>", "Add todo" },
    }
}


-- lvim.builtin.which_key.mappings.t = { function()
--     pcall(function()
--         local buf = vim.api.nvim_get_current_buf()
--         local file = vim.api.nvim_buf_get_name(buf)
--         local folder = string.gsub(file, "/[^/]+$", "")
--         vim.cmd("ToggleTerm dir=" .. folder)
--     end)
-- end, "open terminal next to the file" }
