local function setup_dashboard(mode)
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")
  local fortune = require("alpha.fortune")

  local function charlen(s, pos)
    local byte = string.byte(s, pos)
    if not byte then
      return nil
    end
    return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
  end

  local function apply_colors(logo, colors, logo_colors)
    dashboard.section.header.val = logo

    for key, color in pairs(colors) do
      local name = "Alpha" .. key
      vim.api.nvim_set_hl(0, name, color)
      colors[key] = name
    end

    dashboard.section.header.opts.hl = {}
    for i, line in ipairs(logo_colors) do
      local highlights = {}
      local pos = 0

      for j = 1, #line do
        local opos = pos
        pos = pos + charlen(logo[i], opos + 1)

        local color_name = colors[line:sub(j, j)]
        if color_name then
          table.insert(highlights, { color_name, opos, pos })
        end
      end

      table.insert(dashboard.section.header.opts.hl, highlights)
    end
    return dashboard.opts
  end

  apply_colors({
    [[  ███       ███  ]],
    [[  ████      ████ ]],
    [[  ████     █████ ]],
    [[ █ ████    █████ ]],
    [[ ██ ████   █████ ]],
    [[ ███ ████  █████ ]],
    [[ ████ ████ ████ ]],
    [[ █████  ████████ ]],
    [[ █████   ███████ ]],
    [[ █████    ██████ ]],
    [[ █████     █████ ]],
    [[ ████      ████ ]],
    [[  ███       ███  ]],
    [[                    ]],
    [[  N  E  O  V  I  M  ]],
  }, {
    ["b"] = { fg = "#3399ff", ctermfg = 33 },
    ["a"] = { fg = "#53C670", ctermfg = 35 },
    ["g"] = { fg = "#39ac56", ctermfg = 29 },
    ["h"] = { fg = "#33994d", ctermfg = 23 },
    ["i"] = { fg = "#33994d", bg = "#39ac56", ctermfg = 23, ctermbg = 29 },
    ["j"] = { fg = "#53C670", bg = "#33994d", ctermfg = 35, ctermbg = 23 },
    ["k"] = { fg = "#30A572", ctermfg = 36 },
  }, {
    [[  kkkka       gggg  ]],
    [[  kkkkaa      ggggg ]],
    [[ b kkkaaa     ggggg ]],
    [[ bb kkaaaa    ggggg ]],
    [[ bbb kaaaaa   ggggg ]],
    [[ bbbb aaaaaa  ggggg ]],
    [[ bbbbb aaaaaa igggg ]],
    [[ bbbbb  aaaaaahiggg ]],
    [[ bbbbb   aaaaajhigg ]],
    [[ bbbbb    aaaaajhig ]],
    [[ bbbbb     aaaaajhi ]],
    [[ bbbbb      aaaaajh ]],
    [[  bbbb       aaaaa  ]],
    [[                    ]],
    [[  a  a  a  b  b  b  ]],
  })

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
end

return {
  {
    "cormacrelf/dark-notify",
    dependencies = {
      "goolord/alpha-nvim",
    },
    lazy = false,
    priority = 5000,
    config = function()
      require("dark_notify").run({
        onchange = setup_dashboard,
      })
    end,
    init = setup_dashboard,
  },
}
