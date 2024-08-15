return {
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "one-brain",
          path = "~/Vaults/one-brain",
          overrides = {
            attachments = {
              img_folder = "extras/media",
            },
            daily_notes = {
              folder = os.date("journal/%Y/%m"),
              date_format = "%Y%m%d",
              template = "daily-log",
            },
            disable_frontmatter = true,
            note_id_func = function()
              return os.date("%Y%m%d%H%M")
            end,
            notes_subdir = "zettelkasten",
            templates = {
              folder = "extras/templates",
            },
          },
        },
      },
      ui = {
        checkboxes = {
          [" "] = { char = "", hl_group = "ObsidianTodo" },
          ["\\"] = { char = "", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
          ["v"] = { char = "", hl_group = "ObsidianDone" },
          ["-"] = { char = "", hl_group = "ObsidianDone" },
          [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["<"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["o"] = { char = "", hl_group = "ObsidianDone" },
          ["a"] = { char = "󰔷", hl_group = "ObsidianDone" },
          ["."] = { char = "", hl_group = "ObsidianDone" },
        },
      },
    },
  },
}
