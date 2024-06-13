return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      light_style = "day",
      transparent = false,
      terminal_colors = true,
      styles = {
        comment = { italic = false },
        keyword = { italic = false },
        type = { italic = false },
        storageclass = { italic = false },
        structure = { italic = false },
        parameter = { italic = false },
        annotation = { italic = false },
        tag_attribute = { italic = false },
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = { "qf", "terminal", "help" },
      hide_inactive_statusline = false,
      dim_inactive = true,
      lualine_bold = true,
    },
    init = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
