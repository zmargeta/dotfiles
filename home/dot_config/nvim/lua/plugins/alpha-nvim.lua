return {
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local fortune = require("alpha.fortune")
      vim.api.nvim_set_hl(0, "Logo_Blue", { fg = "#248cbf" })
      vim.api.nvim_set_hl(0, "Logo_Green", { fg = "#78c919" })
      vim.api.nvim_set_hl(0, "Logo_Gradient", { fg = "#78c919", bg = "#248cbf" })
      dashboard.section.header.val = {
        [[ ███       ███ ]],
        [[████      ████]],
        [[██████     █████]],
        [[███████    █████]],
        [[████████   █████]],
        [[█████████  █████]],
        [[█████ ████ █████]],
        [[█████  █████████]],
        [[█████   ████████]],
        [[█████    ███████]],
        [[█████     ██████]],
        [[████      ████]],
        [[ ███       ███ ]],
        [[                  ]],
        [[ N  E  O  V  I  M ]],
      }
      dashboard.section.header.opts.hl = {
        { { "Logo_Blue", 0, 0 }, { "Logo_Green", 1, 14 }, { "Logo_Blue", 23, 34 } },
        { { "Logo_Blue", 0, 2 }, { "Logo_Gradient", 2, 4 }, { "Logo_Green", 4, 19 }, { "Logo_Blue", 27, 40 } },
        { { "Logo_Blue", 0, 4 }, { "Logo_Gradient", 4, 7 }, { "Logo_Green", 7, 22 }, { "Logo_Blue", 29, 42 } },
        { { "Logo_Blue", 0, 8 }, { "Logo_Gradient", 8, 10 }, { "Logo_Green", 10, 25 }, { "Logo_Blue", 31, 44 } },
        { { "Logo_Blue", 0, 10 }, { "Logo_Gradient", 10, 13 }, { "Logo_Green", 13, 28 }, { "Logo_Blue", 33, 46 } },
        { { "Logo_Blue", 0, 13 }, { "Logo_Green", 14, 31 }, { "Logo_Blue", 35, 49 } },
        { { "Logo_Blue", 0, 13 }, { "Logo_Green", 16, 32 }, { "Logo_Blue", 35, 49 } },
        { { "Logo_Blue", 0, 13 }, { "Logo_Green", 17, 33 }, { "Logo_Blue", 35, 49 } },
        { { "Logo_Blue", 0, 13 }, { "Logo_Green", 18, 34 }, { "Logo_Gradient", 33, 35 }, { "Logo_Blue", 35, 49 } },
        { { "Logo_Blue", 0, 13 }, { "Logo_Green", 19, 35 }, { "Logo_Gradient", 34, 35 }, { "Logo_Blue", 35, 49 } },
        { { "Logo_Blue", 0, 13 }, { "Logo_Green", 20, 36 }, { "Logo_Gradient", 35, 37 }, { "Logo_Blue", 37, 49 } },
        { { "Logo_Blue", 0, 13 }, { "Logo_Green", 21, 37 }, { "Logo_Gradient", 36, 37 }, { "Logo_Blue", 37, 49 } },
        { { "Logo_Blue", 1, 13 }, { "Logo_Green", 20, 35 }, { "Logo_Blue", 37, 48 } },
        {},
        { { "Logo_Green", 0, 9 }, { "Logo_Blue", 9, 18 } },
      }
      dashboard.section.buttons.val = {
        dashboard.button("n", "  New File", "<Cmd>ene!<CR>"),
        dashboard.button("p", "  Open Project ", "<Cmd>Telescope project<CR>"),
        dashboard.button("f", "  Open File", "<Cmd>Telescope file_browser<CR>"),
        dashboard.button(".", "  Open Recent File", "<Cmd>Telescope oldfiles<CR>"),
        dashboard.button("c", "  Configuration", "<Cmd>cd " .. vim.fn.stdpath("config") .. "<CR><Cmd>edit .<CR>"),
        dashboard.button("q", "  Quit", "<Cmd>quit<CR>"),
      }
      dashboard.section.footer.val = fortune
      alpha.setup(dashboard.opts)
    end,
  },
}
