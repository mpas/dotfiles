-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
  callback = function(ev)
    local bufnr = ev.buf
    local edit_watch = function()
      require("chezmoi.commands.__edit").watch(bufnr)
    end
    vim.schedule(edit_watch)
  end,
})

-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "*.gohtml,*.gotmpl,*.html",
--   callback = function()
--     if vim.fn.search("{{.\\+}}", "nw") ~= 0 then
--       local buf = vim.api.nvim_get_current_buf()
--       vim.api.nvim_buf_set_option(buf, "filetype", "gotmpl")
--       vim.api.nvim_buf_set_option(buf, "filetype", "html")
--     end
--   end,
-- })
