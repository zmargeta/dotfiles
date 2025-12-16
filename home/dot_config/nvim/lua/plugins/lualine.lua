local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            "b:gitsigns_head",
            icon = "",
          },
        },
        lualine_c = {
          {
            "diff",
            source = diff_source,
            symbols = {
              added = " ",
              modified = " ",
              removed = " ",
            },
            padding = { left = 2, right = 1 },
            cond = nil,
          },
          "diagnostics",
          "filename",
        },
        lualine_x = {
          "encoding",
          {
            "fileformat",
            symbols = {
              unix = "LF",
              dos = "CRLF",
              mac = "LF",
            },
          },
          {
            function()
              local shift_width = vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
              return "󰌒 " .. shift_width
            end,
            padding = 1,
          },
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
}
