return {
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      renderer = {
        root_folder_modifier = ":t",
        icons = {
          git_placement = "signcolumn",
          diagnostics_placement = "signcolumn",
          modified_placement = "signcolumn",
          bookmarks_placement = "signcolumn",
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "",
              untracked = "",
              deleted = "",
              ignored = "",
            },
          },
        },
      },
      view = {
        width = 35,
        side = "left",
        signcolumn = "yes",
      },
    },
  },
}
