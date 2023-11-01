local M = {}

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

return M
