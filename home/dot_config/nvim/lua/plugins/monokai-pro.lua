return {
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    opts = {
      styles = {
        comment = { italic = false },
        keyword = { italic = false },
        type = { italic = false },
        storageclass = { italic = false },
        structure = { italic = false },
        parameter = { italic = false },
        annotation = { italic = false },
        tag_attribute = { italic = false },
      },
      filter = "octagon",
    },
    init = function()
      vim.cmd.colorscheme("monokai-pro")
    end,
  },
}
