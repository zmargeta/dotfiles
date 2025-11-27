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
        bullets = { char = "-", hl_group = "ObsidianBullet" },
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["\\"] = { char = "󰄗", hl_group = "ObsidianDone" },
          ["x"] = { char = "󰄵", hl_group = "ObsidianDone" },
          ["v"] = { char = "󰄵", hl_group = "ObsidianDone" },
          ["-"] = { char = "󱋭", hl_group = "ObsidianTodo" },
          [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["<"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["o"] = { char = "", hl_group = "ObsidianTilde" },
          ["a"] = { char = "󰔷", hl_group = "ObsidianTilde" },
          ["."] = { char = "", hl_group = "ObsidianTodo" },
        },
        hl_groups = {
          ObsidianTodo = { bold = false, fg = "#8d8fa2" },
          ObsidianDone = { bold = false, fg = "#e3a092" },
          ObsidianRightArrow = { bold = false, fg = "#17929a" },
          ObsidianTilde = { bold = false, fg = "#8938ef" },
          ObsidianImportant = { bold = false, fg = "#d73128" },
          ObsidianBullet = { bold = false, fg = "#8d8fa2" },
          ObsidianRefText = { underline = false, fg = "#dc8b79" },
          ObsidianExtLinkIcon = { fg = "#dc8b79" },
          ObsidianTag = { italic = false, fg = "#8938ef" },
          ObsidianBlockID = { italic = false, fg = "#8938ef" },
          ObsidianHighlightText = { bold = false, fg = "#4d4f69" },
        },
      },
    },
  },
}
