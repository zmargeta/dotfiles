return {
  {
    "sainnhe/gruvbox-material",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_backgroud = "hard"
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_disable_italic_comment = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
