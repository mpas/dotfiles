local M = {}

function M.delete_current_file()
  local current_file = vim.fn.expand("%:p")
  if current_file and current_file ~= "" then
    -- Check if trash utility is installed
    if vim.fn.executable("trash") == 0 then
      vim.api.nvim_echo({
        { "- Trash utility not installed. Make sure to install it first\n", "ErrorMsg" },
        { "- In macOS run `brew install trash`\n", nil },
      }, false, {})
      return
    end
    -- Prompt for confirmation before deleting the file
    vim.ui.input({
      prompt = "Type 'del' to delete the file '" .. current_file .. "': ",
    }, function(input)
      if input == "del" then
        -- Delete the file using trash app
        local success, _ = pcall(function()
          vim.fn.system({ "trash", vim.fn.fnameescape(current_file) })
        end)
        if success then
          vim.api.nvim_echo({
            { "File deleted from disk:\n", "Normal" },
            { current_file, "Normal" },
          }, false, {})
          -- Close the buffer after deleting the file
          vim.cmd("bd!")
        else
          vim.api.nvim_echo({
            { "Failed to delete file:\n", "ErrorMsg" },
            { current_file, "ErrorMsg" },
          }, false, {})
        end
      else
        vim.api.nvim_echo({
          { "File deletion canceled.", "Normal" },
        }, false, {})
      end
    end)
  else
    vim.api.nvim_echo({
      { "No file to delete", "WarningMsg" },
    }, false, {})
  end
end

function M.readfile(filename)
  local file = io.open(filename, "r")
  if not file then
    error("Error: File not found or could not be opened.")
  end

  local content = file:read("*a")
  file:close()
  return content
end

function M.writefile(filename, content)
  local file = io.open(filename, "w")
  if not file then
    error("Error: File could not be opened for writing.")
  end

  file:write(content)
  file:close()
end

function M.toggleCopilot()
  local copilotClient = require("copilot.client")
  local copilotCommand = require("copilot.command")

  if copilotClient.is_disabled() then
    vim.notify("Copilot is disabled, enabling it...", vim.log.levels.INFO)
    copilotCommand.enable()
  else
    vim.notify("Copilot is enabled, disabling it...", vim.log.levels.INFO)
    copilotCommand.disable()
  end
end

-- Function to run vimgrep and populate the Quickfix List
-- function M.live_grep_to_quickfix(pattern, directory)
--   -- Ensure that the directory path is expanded (in case of ~ for home directory)
--   local expanded_dir = vim.fn.expand(directory)
--
--   -- Construct the vimgrep command
--   local cmd = string.format("vimgrep /%s/ %s/**/*.md", pattern, expanded_dir)
--
--   -- Execute the vimgrep command
--   vim.cmd(cmd)
--
--   -- Open the quickfix list to show the results
--   vim.cmd("copen")
-- end

return M
