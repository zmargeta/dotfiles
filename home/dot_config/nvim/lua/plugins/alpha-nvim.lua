return {
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local fortune = require("alpha.fortune")
      vim.api.nvim_set_hl(0, "neovim_blue", { fg = "#248cbf" })
      vim.api.nvim_set_hl(0, "neovim_green", { fg = "#78c919" })
      vim.api.nvim_set_hl(0, "neovim_bleen", { fg = "#78c919", bg = "#248cbf" })
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
        { { "neovim_blue", 0, 0 }, { "neovim_green", 1, 14 }, { "neovim_blue", 23, 34 } },
        { { "neovim_blue", 0, 2 }, { "neovim_bleen", 2, 4 }, { "neovim_green", 4, 19 }, { "neovim_blue", 27, 40 } },
        { { "neovim_blue", 0, 4 }, { "neovim_bleen", 4, 7 }, { "neovim_green", 7, 22 }, { "neovim_blue", 29, 42 } },
        { { "neovim_blue", 0, 8 }, { "neovim_bleen", 8, 10 }, { "neovim_green", 10, 25 }, { "neovim_blue", 31, 44 } },
        { { "neovim_blue", 0, 10 }, { "neovim_bleen", 10, 13 }, { "neovim_green", 13, 28 }, { "neovim_blue", 33, 46 } },
        { { "neovim_blue", 0, 13 }, { "neovim_green", 14, 31 }, { "neovim_blue", 35, 49 } },
        { { "neovim_blue", 0, 13 }, { "neovim_green", 16, 32 }, { "neovim_blue", 35, 49 } },
        { { "neovim_blue", 0, 13 }, { "neovim_green", 17, 33 }, { "neovim_blue", 35, 49 } },
        { { "neovim_blue", 0, 13 }, { "neovim_green", 18, 34 }, { "neovim_bleen", 33, 35 }, { "neovim_blue", 35, 49 } },
        { { "neovim_blue", 0, 13 }, { "neovim_green", 19, 35 }, { "neovim_bleen", 34, 35 }, { "neovim_blue", 35, 49 } },
        { { "neovim_blue", 0, 13 }, { "neovim_green", 20, 36 }, { "neovim_bleen", 35, 37 }, { "neovim_blue", 37, 49 } },
        { { "neovim_blue", 0, 13 }, { "neovim_green", 21, 37 }, { "neovim_bleen", 36, 37 }, { "neovim_blue", 37, 49 } },
        { { "neovim_blue", 1, 13 }, { "neovim_green", 20, 35 }, { "neovim_blue", 37, 48 } },
        {},
        { { "neovim_green", 0, 9 }, { "neovim_blue", 9, 18 } },
      }
      dashboard.section.buttons.val = {
        dashboard.button("n", "  New File", "<Cmd>ene!<CR>"),
        dashboard.button("p", "  Open Project ", "<Cmd>Telescope project<CR>"),
        dashboard.button("f", "  Open File", "<Cmd>Telescope find_files<CR>"),
        dashboard.button(".", "  Open Recent File", "<Cmd>Telescope oldfiles<CR>"),
        dashboard.button("l", "  Find by Live Grep", "<Cmd>Telescope live_grep<CR>"),
        dashboard.button("c", "  Configuration", "<Cmd>cd " .. vim.fn.stdpath("config") .. "<CR><Cmd>edit .<CR>"),
        dashboard.button("q", "  Quit", "<Cmd>quit<CR>"),
      }
      dashboard.section.footer.val = fortune
      alpha.setup(dashboard.opts)
    end,
  },
}
