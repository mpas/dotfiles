return {
  {
    "epwalsh/obsidian.nvim",
    version = "v3.9.0", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      "BufReadPre /Users/mpas/Dropbox/notes/**.md",
      "BufNewFile /Users/mpas/Dropbox/notes/**.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      callbacks = {
        -- Runs right before writing the buffer for a note.
        ---@param client obsidian.Client
        ---@param note obsidian.Note
        ---@diagnostic disable-next-line: unused-local
        pre_write_note = function(client, note)
          note:add_field("modified", os.date("%Y-%m-%d %H:%M", os.time()))
        end,
      },

      note_frontmatter_func = function(note)
        -- Add the title of the note as an alias.
        if note.title then
          note:add_alias(note.title)
        end

        -- custom frontmatter, we only want to keep the tags
        local out = { tags = note.tags }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,

      note_path_func = function(spec)
        -- This is equivalent to the default behavior.
        -- custom path for the note, we use the title
        local path = spec.dir / tostring(spec.title)
        return path:with_suffix(".md")
      end,

      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        -- vim.fn.jobstart({ "open", url }) -- Mac OS
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
        -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
        vim.ui.open(url) -- need Neovim 0.10.0+
      end,

      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function substitutions = {},
        substitutions = {
          time24 = function()
            return os.date("%H:%M:%S")
          end,
          time12 = function()
            -- Conversion to 12-hour format with AM/PM
            local hour = tonumber(os.date("%H"))
            local ampm = hour >= 12 and "PM" or "AM"
            hour = hour % 12
            hour = hour == 0 and 12 or hour
            return string.format("%02d:%s %s", hour, os.date("%M:%S"), ampm)
          end,
          year = function()
            return os.date("%Y", os.time())
          end,
          month = function()
            return os.date("%B", os.time())
          end,
          created = function()
            return os.date("%Y-%m-%d %H:%M", os.time())
          end,
          today = function()
            return os.date("%Y-%m-%d", os.time())
          end,
          yesterday = function()
            return os.date("%Y-%m-%d", os.time() - 86400)
          end,
          nextday = function()
            return os.date("%Y-%m-%d", os.time() + 86400)
          end,
          hdate = function()
            return os.date("%A, %B %d, %Y")
          end,
          rfc3339 = function()
            return os.date("!%Y-%m-%dT%H:%M:%SZ")
          end,
          week = function()
            return os.date("%V", os.time())
          end,
          isoweek = function()
            return os.date("%G-W%V", os.time())
          end,
          isoprevweek = function()
            local adjustment = -7 * 24 * 60 * 60 -- One week in seconds
            return os.date("%G-W%V", os.time() + adjustment)
          end,
          isonextweek = function()
            local adjustment = 7 * 24 * 60 * 60 -- One week in seconds
            return os.date("%G-W%V", os.time() + adjustment)
          end,
          day_of_month = function()
            return os.date("%d", os.time())
          end,
          month_numeric = function()
            return os.date("%m", os.time())
          end,
          weekday = function()
            return os.date("%A", os.time())
          end,
        },
      },
      workspaces = {
        {
          name = "default",
          path = "~/Dropbox/notes",
        },
      },

      daily_notes = {
        folder = "/04-journal/daily",
        date_format = "%Y-%m-%d %A",
        template = "daily.md",
      },
    },
  },
}
