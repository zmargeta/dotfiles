return {
  {
    "catppuccin/nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        background = {
          dark = "macchiato",
          light = "latte",
        },
        highlight_overrides = {
          all = function(colors)
            return {
              ["@markup.link"] = { fg = colors.yellow },
              ["@markup.link.label"] = { fg = colors.yellow },
              ["@markup.link.url"] = { fg = colors.yellow, style = {} },
              RenderMarkdownBullet = { fg = colors.subtext0 },
              RenderMarkdownLink = { fg = colors.yellow },
              RenderMarkdownWikiLink = { fg = colors.yellow },
            }
          end,
        },
        integrations = {
          harpoon = true,
          mason = true,
          noice = true,
          notify = true,
          which_key = true,
        },
        no_italic = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
