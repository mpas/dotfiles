-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local vk = vim.keymap
local wk = require("which-key")

local custom_functions = require("util.custom_functions")

-- ================================================================================
-- Remove default keymaps (https://www.lazyvim.org/keymaps)
-- - Default keymaps that are always set: (https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua)
--
-- Which-key keymaps are defined in the plugins; to override these see (https://www.lazyvim.org/configuration/plugins)
-- ================================================================================
-- Keymap to delete the current file
vim.keymap.set("n", "<leader>fD", function()
  custom_functions.delete_current_file()
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
wk.add({ "<leader>fs", "<cmd>source %<cr>", desc = "Source current file", mode = "n" })

wk.add({ "<leader>T", group = "toggle" })
wk.add({ "<leader>Tc", custom_functions.toggleCopilot, desc = "Copilot", mode = "n" })
wk.add({ "<leader>Tm", group = "markdown" })
wk.add({ "<leader>Tmm", "<cmd>MarpToggle<cr>", desc = "Marp", mode = "n" })
wk.add({ "<leader>Tmt", "<cmd>TableModeToggle<cr>", desc = "TableMode", mode = "n" })
wk.add({ "<leader>Tz", "<cmd>ZenMode<cr>", desc = "ZenMode", mode = "n" })

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
wk.add({ "<leader>nt", group = "tasks" })
wk.add({ "<leader>nto", "<cmd>ObsidianQuickSwitch tasks<cr>", desc = "Open tasks", mode = "n" })
wk.add({
  "<leader>nts",
  "<cmd>lua require('telescope.builtin').grep_string({search_dirs = {'/Users/mpas/Dropbox/notes'}, word_match = '-w', use_regex=true, search = '- \\\\[ \\\\].*#todo'})<cr>",
  desc = "Unchecked tasks",
  mode = "n",
})

wk.add({ "<leader>i", group = "insert" })
wk.add({ "<leader>ii", "<cmd>IconPickerNormal<cr>", desc = "Icon", mode = "n" })
