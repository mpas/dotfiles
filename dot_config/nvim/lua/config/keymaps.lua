local functions = require("util.functions")

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local vk = vim.keymap
local wk = require("which-key")

-- ================================================================================
-- Remove default keymaps (https://www.lazyvim.org/keymaps)
-- - Default keymaps that are always set: (https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua)
--
-- Which-key keymaps are defined in the plugins; to override these see (https://www.lazyvim.org/configuration/plugins)
-- ================================================================================
vim.keymap.del("n", "<leader>L")
vim.keymap.del("n", "<leader>qq")

-- Keymap to delete the current file
vim.keymap.set("n", "<leader>fD", function()
  functions.delete_current_file()
end, { desc = "[P]Delete current file" })

-- ================================================================================
-- Set keymaps
-- ================================================================================
vk.set("n", "<leader>w", "<cmd>write<cr>", { noremap = true, silent = true, desc = "Save" })
vk.set("n", "<leader>W", "<cmd>noautocmd w<cr>", { noremap = true, silent = true, desc = "Save without formatting" })
vk.set("n", "<TAB>", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "Buffer Next" })
vk.set("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true, desc = "Buffer Previous" })
vk.set("i", ";;", "<Esc>", { noremap = true, silent = true })

-- Remap K and J
vim.keymap.set({ "n", "v" }, "<leader>k", "K", { noremap = true, desc = "Keyword" })
vim.keymap.set({ "n", "v" }, "<leader>j", "J", { noremap = true, desc = "Join lines" })

-- ================================================================================
-- Which-key keymaps
-- ================================================================================
wk.add({
  "<leader>fs",
  "<cmd>source %<cr>",
  desc = "Source current file",
  icon = { icon = " ", color = "green" },
  mode = "n",
})

wk.add({ "<leader>ga", "<cmd>GhActionsCR<cr>", desc = "Open Github Actions", mode = "n" })
wk.add({ "<leader>at", functions.toggleCopilot, desc = "Toggle Copilot", mode = "n" })

wk.add({ "<leader>n", group = "notes" })
wk.add({ "<leader>nb", "<cmd>ObsidianBacklinks<cr>", desc = "View Backlinks", mode = "n" })
wk.add({ "<leader>nc", "<cmd>ObsidianTOC<cr>", desc = "Browse Content", mode = "n" })
wk.add({ "<leader>nd", "<cmd>ObsidianDailies<cr>", desc = "Daily Notes", mode = "n" })
wk.add({ "<leader>ne", "<cmd>ObsidianExtractNote<cr>", desc = "New Note from Selection", mode = "v" })
wk.add({ "<leader>nn", "<cmd>ObsidianNewFromTemplate<cr>", desc = "New Note from Template", mode = "n" })
wk.add({ "<leader>no", "<cmd>ObsidianOpen<cr>", desc = "Open Note in Obsidian", mode = "n" })
wk.add({ "<leader>np", "<cmd>ObsidianPasteImg<cr>", desc = "Paste Image", mode = "n" })
wk.add({ "<leader>nr", "<cmd>ObsidianRename<cr>", desc = "Rename/Move Note", mode = "n" })
wk.add({ "<leader>ns", "<cmd>ObsidianSearch<cr>", desc = "Search Notes", mode = "n" })
wk.add({ "<leader>nt", "<cmd>ObsidianQuickSwitch tasks<cr>", desc = "Open tasks", mode = "n" })

wk.add({ "<leader>kk", '<cmd>lua require("kubectl").toggle()<cr>', desc = "Kubectl", mode = "n" })

wk.add({ "<leader>go", "<cmd>Octo<cr>", desc = "Octo", mode = "n" })

-- local normal_mode_mappings = {
--   [";"] = { "<cmd>Dashboard<cr>", "Dashboard" },
--
--   -- cd = {
--   --   name = "+documentation",
--   --   C = { "<cmd>Neogen class<cr>", "Class Doc" },
--   --   d = { "<cmd>DogeGenerate<cr>", "Generate Doc" },
--   --   f = { "<cmd>Neogen func<cr>", "Func Doc" },
--   --   F = { "<cmd>Neogen file<cr>", "File Doc" },
--   -- },
--
--   f = {
--     s = { ":source %<cr>", "Source current file" },
--   },
--
--   i = {
--     name = "+insert",
--     i = { "<cmd>IconPickerNormal<cr>", "Icon" },
--     t = { "<cmd>ZkNew { title = 'inbox', dir = '' }<cr>", "Todo" },
--   },
--
--   -- m = {
--   --   name = "+mark",
--   --   m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark file" },
--   --   t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
--   --   a = { ":lua require('harpoon.ui').nav_file(1)<cr>", "Goto mark 1" },
--   --   s = { ":lua require('harpoon.ui').nav_file(2)<cr>", "Goto mark 2" },
--   --   d = { ":lua require('harpoon.ui').nav_file(3)<cr>", "Goto mark 3" },
--   --   f = { ":lua require('harpoon.ui').nav_file(4)<cr>", "Goto mark 4" },
--   --   g = { ":lua require('harpoon.ui').nav_file(5)<cr>", "Goto mark 5" },
--   --   q = { ":lua require('harpoon.ui').nav_file(6)<cr>", "Goto mark 6" },
--   --   w = { ":lua require('harpoon.ui').nav_file(7)<cr>", "Goto mark 7" },
--   --   e = { ":lua require('harpoon.ui').nav_file(8)<cr>", "Goto mark 8" },
--   --   r = { ":lua require('harpoon.ui').nav_file(9)<cr>", "Goto mark 9" },
--   --   n = { ":lua require('harpoon.ui').nav_next()<cr>", "Next file" },
--   --   p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
--   -- },
--
--   n = {
--     name = "+notes",
--     n = { "<cmd>ObsidianNew<cr>", "New note" },
--     s = { "<cmd>ObsidianSearch<cr>", "Search" },
--
--     --   -- Dailys
--     --   d = {
--     --     name = "+daillies",
--     --     a = {
--     --       "<cmd>ZkNew { template = 'daily.md', dir = 'journal/daily' }<cr>",
--     --       "Add/Open for today",
--     --     },
--     --     A = {
--     --       "<cmd>ZkNew { template = 'daily.md', dir = 'journal/daily', date = vim.fn.input('Date: ')}<cr>",
--     --       "Add/Open for a specific date",
--     --     },
--     --   },
--     --   -- Todos
--     --   t = {
--     --     name = "+todos",
--     --     l = { "<cmd>ZkOpenNoteAndGotoHeader { title = 'inbox', header = '# Inbox' }<cr>", "Open Inbox" },
--     --     a = {
--     --       "<cmd>ZkAddTodo { template = 'todo-with-title.md', title = vim.fn.input('Title: '), file = '/Users/mpas/Dropbox/notes/inbox.md', header = '# Inbox'}<cr>",
--     --       "Add with title",
--     --     },
--     --     A = {
--     --       "<cmd>ZkAddTodo { template = 'todo-with-title-and-content.md', title = vim.fn.input('Title: '), content = vim.fn.input('Content: '), file = '/Users/mpas/Dropbox/notes/inbox.md', header = '# Inbox'}<cr>",
--     --       "Add with title and content",
--     --     },
--     --   },
--     --   -- General notes
--     --   n = {
--     --     name = "+notes",
--     --     a = { "<cmd>ZkNew { title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: ') }<cr>", "Add" },
--     --     A = {
--     --       ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.input('Dir: ') }<cr>",
--     --       "Add using current selection as title",
--     --     },
--     --     C = {
--     --       ":'<,'>ZkNewFromContentSelection { title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: ') }<cr>",
--     --       "Add using current selection as content",
--     --     },
--     --   },
--     --   i = { "<cmd>ZkIndex { force = true }<cr>", "Index" },
--     --   b = { "<cmd>ZkNotes { sort = { 'modified' } }<cr>", "Browse" },
--     --   l = {
--     --     name = "+links",
--     --     b = { "<cmd>ZkBacklinks<cr>", "Inbound" },
--     --     o = { "<cmd>ZkLinks<cr>", "Outbound" },
--     --     i = { "<cmd>ZkInsertLink<cr>", "Insert" },
--     --   },
--     --   s = {
--     --     name = "+search",
--     --     t = { "<cmd>ZkNotes { sort = { 'modified' } }<cr>", "Title" },
--     --     T = { "<cmd>ZkTags<cr>", "Tags" },
--     --     c = { "<cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<cr>", "Content" },
--     --     v = { ":'<,'>ZkMatch<cr>", "Visual selection" },
--     --   },
--   },
--   u = {
--     -- c = {
--     --   name = "codi",
--     --   e = { "<cmd>codi<cr>", "codi (enable)" },
--     --   d = { "<cmd>codi!<cr>", "codi (disable)" },
--     -- },
--     m = {
--       name = "markdown",
--       p = { "<cmd>MarkdownPreviewToggle<cr>", "Preview" },
--       t = { "<cmd>TableModeToggle<cr>", "Table Mode" },
--     },
--     z = { "<cmd>ZenMode<cr>", "Toggle Zen Mode" },
--   },
--
--   q = {
--     name = "+quit",
--     b = { ":bd<cr>", "Buffer" },
--     B = { ":%bd|e#|bd#<cr>", "All other buffers" },
--     x = { ":wqa<cr>", "Save all and quit" },
--     q = { "<cmd>qa<cr>", "Quit all" },
--   },
--
--   t = {
--     name = "+toggle",
--     c = { "<cmd>ToggleCheckbox<cr>", "Checkbox" },
--     m = {
--       name = "markdown",
--       p = { "<cmd>MarkdownPreviewToggle<cr>", "Preview" },
--       t = { "<cmd>TableModeToggle<cr>", "Table Mode" },
--       m = { "<cmd>MarpToggle<cr>", "Marp" },
--     },
--     z = { "<cmd>ZenMode<cr>", "Toggle Zen Mode" },
--   },
-- }

-- wk.register(normal_mode_mappings, { prefix = "<leader>" })
--
-- local visual_mode_mappings = {
--   n = {
--     name = "Notes",
--     c = {
--       ":'<,'>ZkNewFromContentSelection { title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: ') }<cr>",
--       "New note - with selection as content",
--     },
--     t = { ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.input('Dir: ') }<cr>", "New note - with selection as title" },
--     s = { ":'<,'>ZkMatch<cr>", "Search using selection" },
--     l = {
--       name = "+Links",
--       i = { ":'<,'>ZkInsertLinkAtSelection<cr>", "Insert" },
--     },
--   },
-- }
-- wk.register(visual_mode_mappings, { mode = "v", prefix = "<leader>" })
--
