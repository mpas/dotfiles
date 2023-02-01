-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- lvim.builtin.dap.on_config_done = function()
--     | lvim.builtin.which_key.mappings['d'] = { |
--         name = "+debug",
--         t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
--         b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
--         c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
--         C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
--         d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
--         g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
--         i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
--         o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
--         u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
--         p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
--         r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
--         s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
--         q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
--         U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
--     }key
-- end

-- lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
-- lvim.builtin.which_key.mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
-- lvim.builtin.which_key.vmappings["d"] = {
--     name = "Debug",
--     s = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
-- }

lvim.keys.visual_mode["<leader>ref"] = ":lua require('refactoring').refactor('Extract Function')<cr>"
lvim.keys.visual_mode["<leader>reff"] = ":lua require('refactoring').refactor('Extract Function To File')<cr>"
lvim.keys.visual_mode["<leader>rev"] = ":lua require('refactoring').refactor('Extract Variable')<cr>"
lvim.keys.visual_mode["<leader>riv"] = ":lua require('refactoring').refactor('Inline Variable')<cr>"
lvim.keys.normal_mode["<leader>riv"] = ":lua require('refactoring').refactor('Inline Variable')<cr>"
lvim.keys.visual_mode["<leader>rr"] = ":lua require('refactoring').select_refactor()<cr>"
lvim.keys.normal_mode["<leader>rpf"] = ":lua require('refactoring').debug.printf({below = false})<cr>"
lvim.keys.visual_mode["<leader>rdpv"] = ":lua require('refactoring').debug.print_var({})<cr>"
lvim.keys.normal_mode["<leader>rdpv"] = ":lua require('refactoring').debug.print_var({ normal = true })<cr>"
lvim.keys.normal_mode["<leader>rdc"] = ":lua require('refactoring').debug.cleanup({})<cr>"

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
lvim.lsp.buffer_mappings.normal_mode["o"] = { "<cmd>SymbolsOutline<cr>", "Outline" }
lvim.lsp.buffer_mappings.normal_mode["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Documentation" }

-- lvim.keys.normal_mode["<F2>"] = ":lua require'dap'.continue()<cr>"
-- lvim.keys.normal_mode["<F9>"] = ":lua require'dap'.toggle_breakpoint()<cr>"

-- remove all keybindings from whichkey and add our own
-- lvim.builtin.which_key.mappings = {

--     -- debug (needs to be in a function see https://github.com/LunarVim/LunarVim/issues/3456)
--     d = {
--         name = "+debug",
--         R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
--         E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
--         C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
--         U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
--         b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
--         c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
--         d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
--         e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
--         g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
--         h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
--         S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
--         i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
--         o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
--         p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
--         q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
--         r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
--         s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
--         t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
--         x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
--         u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
--     },
--     -- find
--     f = {
--         name = "+find",
--         b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
--         B = { "<cmd>Telescope vim_bookmarks<cr>", "Find Bookmark" },
--         C = { "<cmd>Telescope commands<cr>", "Commands" },
--         c = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
--             "Colorscheme with Preview", },
--         f = { "<cmd>Telescope find_files<cr>", "Find File" },
--         h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
--         H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
--         k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
--         M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
--         n = { "<cmd>nvimtreefindfile<cr>", "find current file in tree" },
--         p = { "<cmd>Telescope projects<cr>", "Find Project" },
--         R = { "<cmd>Telescope neoclip<cr>", "Registers" },
--         q = { "<cmd>Telescope quickfix()<CR>", "in quickfix list" },
--         r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--         s = { "<cmd>Telescope lsp_document_symbols()<CR>", "document symbols" },
--         S = { "<cmd>Telescope lsp_workspace_symbols()<CR>", "workspace symbols" },
--         t = { "<cmd>Telescope live_grep<cr>", "Text" },
--         w = { "<cmd>Telescope grep_string()<CR>", "word" },
--         x = { "<cmd>lua require('spectre').open_visual()<cr>", "Replace" }
--     },

--     -- git
--     g = {
--         name = "+git",
--         b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--         d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff", },
--         c = {
--             name = "+gitclient",
--             n = { "<cmd>Neogit<cr>", "Neogit" },
--             l = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
--         },
--         i = {
--             name = "+issue",
--             l = { "<cmd>Octo issue list<cr>", "List" },
--             c = { "<cmd>Octo issue create<cr>", "Create" },
--         },
--         s = { "<cmd>Telescope git_status<cr>", "Open changed file" },
--         p = {
--             name = "+pull-request",
--             l = { "<cmd>Octo pr list<cr>", "List" },
--             c = { "<cmd>Octo pr create<cr>", "Create" },
--         },
--     },

--     -- insert stuff
--     i = {
--         name = "+insert",
--         i = { "<cmd>IconPickerNormal<cr>", "Icon" },
--         t = { "<cmd>ZkNew { title = 'inbox', dir = '' }<cr>", "Todo" },
--     },


--     -- python
--     P = {
--         name = "+python",
--         i = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Pick Env" },
--         d = { "<cmd>lua require('swenv.api').get_current_venv()<cr>", "Show Env" },
--     },

lvim.builtin.which_key.mappings["dl"] = { "<cmd>lua require'dap'.run_last()<cr>", "Run last" }

lvim.builtin.which_key.mappings["sT"] = { "<cmd>lua require('telescope.builtin').live_grep({search_dirs={vim.fn.expand('%:p')}})<cr>",
    "Text in buffer" }

lvim.builtin.which_key.mappings["D"] = {
    name = "Documentation",
    C = { "<cmd>Neogen class<cr>", "Class Doc" },
    d = { "<cmd>DogeGenerate<Cr>", "Generate Doc" },
    f = { "<cmd>Neogen func<cr>", "Func Doc" },
    F = { "<cmd>Neogen file<cr>", "File Doc" },
}

lvim.builtin.which_key.mappings["j"] = {
    name = "Jump",
    a = { "<Cmd>lua require('harpoon.mark').add_file()<Cr>", "Add File" },
    c = { "<Cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<Cr>", "Command Menu" },
    m = { "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<Cr>", "UI Menu" },
}

lvim.builtin.which_key.mappings["n"] = {
    name = "Notes",
    t = { ":lua open_existing_note_with_title('inbox')<cr>", "Inbox" },
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
}

lvim.builtin.which_key.mappings["q"] = {
    name = "Quit",
    w = { "<cmd>q<CR>", "window" },
    W = { "<cmd>wincmd o<CR>", "all other windows" },
    b = { "<cmd>Bdelete<CR>", "buffer" },
    B = { "<cmd>BufOnly!<CR>", "all other buffers" },
    t = { "<cmd>tabclose<CR>", "tab" },
    T = { "<cmd>tabonly<CR>", "all other tabs" },
    q = { "<cmd>cclose<CR>", "quickfix list" },
}

-- lvim.builtin.which_key.mappings["r"] = {
--     name = "Refactor",
--     f = { "<cmd>lua require('refactoring').refactor('Extract Function')<cr>", "Extract Function" },
--     F = { "<cmd>lua require('refactoring').refactor('Extract Function To File')<cr>", "Extract Function To File" },
--     v = { "<cmd>lua require('refactoring').refactor('Extract Variable')<cr>", "Extract Variable" },
--     i = { "<cmd>lua require('refactoring').refactor('Inline Variable')<cr>", "Inline Variable" },
--     p = { "<cmd>lua require('refactoring').debug.printf({below = false})<cr>", "Debug Print" },
--     c = { "<cmd>lua require('refactoring').debug.cleanup({below = false})<cr>", "Debug Cleanup" },
-- }

lvim.builtin.which_key.mappings["t"] = {
    name = "Toggle",
    c = {
        name = "Codi",
        e = { "<cmd>Codi<cr>", "Codi (enable)" },
        d = { "<cmd>Codi!<cr>", "Codi (disable)" },
    },
    m = {
        name = "Markdown",
        p = { "<cmd>MarkdownPreviewToggle<cr>", "Preview" },
        -- t = { "<cmd>TableModeToggle<cr>", "Table Mode" },
    },
    t = {
        name = "+Trouble",
        t = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
        d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
        r = { "<cmd>Trouble lsp_references<cr>", "References" },
        f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
        q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
        l = { "<cmd>Trouble loclist<cr>", "LocationList" },
        w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    },
    u = { "<cmd>UndotreeToggle<cr>", "UndoTree" },
    z = { "<cmd>ZenMode<cr>", "Zen Mode" },
    v = { ":lua Toggle_venn()<cr>", "Venn" },
    w = { "<cmd>set wrap!<cr>", "Line wrap" },
    s = { "<cmd>set spell!<cr>", "Spelling" },
}
