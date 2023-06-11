function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd [[setlocal ve=all]]
        -- draw a line on HJKL keystrokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
    else
        vim.cmd [[setlocal ve=]]
        vim.cmd [[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end

function _G.open_existing_note_with_title(note_title)
    -- open existing file
    require("zk.commands").get("ZkNew")({ title = note_title, dir = "" })
    vim.wait(100)
    -- vim.fn.feedkeys("G$a")
    -- search and move to the correct header
    local line_number_containing_header = vim.fn.search("# Header 1")


    -- -- move the cursor to the header
    -- vim.fn.cursor({ line_number_containing_header, 0 })
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<S-}>", true, true, true), "i")
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    print(line_number_containing_header, row, col)

    -- -- check if we are still on the first header
    -- if row == line_number_containing_header then
    --     print(line_number_with_header, row, "yes")
    --     -- we need to create 2 lines
    --     vim.cmd('normal o')
    --     vim.cmd('normal o')
    -- else
    --     print("we can enter")
    -- end

    -- local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    -- vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
    -- vim.fn.feedkeys("o")
end

-- text = [[This is a multiline text

-- not sure what line
-- number
-- this is]]
-- i, j = string.find(text, "not")
-- print(i, j)
