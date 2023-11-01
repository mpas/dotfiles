local file_utils = require("util.file_utils")

local M = {}

local function add_content_to_markdown_header(markdown, header, content)
  -- Find the position of the header
  local markdown_header_pos = markdown:find(header, 1, true)

  -- Check if the header is not found and throw an error
  if not markdown_header_pos then
    error("Header '" .. header .. "' not found in the markdown content.")
  end

  -- Find the position of the next newline character after the header
  local next_newline_pos = markdown:find("\n", markdown_header_pos, true)

  -- Calculate the position to insert the content (one character after the newline)
  local insert_pos = next_newline_pos + 1

  -- Insert the content at the calculated position
  local updated_content = markdown:sub(1, insert_pos) .. content .. markdown:sub(insert_pos + 1)

  return updated_content
end

local function render_zk_template(template_options, filename, header, cb)
  local api = require("zk.api")

  -- Set default options with dryRun as true
  local local_template_options = { dryRun = true }

  -- Merge provided options into local_options (overrides defaults)
  for k, v in pairs(template_options or {}) do
    local_template_options[k] = v
  end

  -- Render the template
  api.new(nil, local_template_options, function(err, res)
    assert(not err, tostring(err))
    cb(res.content)
  end)
end

function M.render_zk_template_in_file(template_options, filename, header)
  render_zk_template(template_options, filename, header, function(rendered_template_content)
    local input = file_utils.readfile(filename)
    local output = add_content_to_markdown_header(input, header, rendered_template_content)
    file_utils.writefile(filename, output)
  end)
end

return M
