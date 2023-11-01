local zk = require("zk")
local commands = require("zk.commands")
local zk_utils = require("util.zk_utils")

commands.add("ZkAddTodo", function(options)
  zk_utils.render_zk_template_in_file(
    { template = options.template, title = options.title, content = options.content },
    options.file,
    options.header
  )
end)

commands.add("ZkOpenNoteAndGotoHeader", function(options)
  commands.get("ZkNew")({ title = options.title, dir = options.dir })
  vim.wait(100)
  vim.cmd("normal! gg")
  vim.fn.search(options.header)
  vim.cmd("normal! 2j")
end)
