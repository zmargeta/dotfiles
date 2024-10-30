return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        background = {
          dark = "macchiato",
          light = "latte",
        },
        integrations = {
          harpoon = true,
          mason = true,
          noice = true,
          notify = true,
          which_key = true,
        },
        no_italic = true,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
