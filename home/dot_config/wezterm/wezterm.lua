local wezterm = require("wezterm")

local function color_scheme()
  if wezterm.gui.get_appearance():find("Dark") then
    return "Catppuccin Macchiato"
  else
    return "Catppuccin Latte"
  end
end

local function font()
  if wezterm.gui.get_appearance():find("Dark") then
    return wezterm.font_with_fallback({
      { family = "Berkeley Mono", weight = "Regular" },
      { family = "JetBrains Mono", weight = "Regular", style = "Normal" },
    })
  else
    return wezterm.font_with_fallback({
      { family = "Berkeley Mono", weight = "Regular" },
      { family = "JetBrains Mono", weight = "Regular", style = "Normal" },
    })
  end
end

local config = {
  color_scheme = color_scheme(),
  colors = {
    tab_bar = {
      active_tab = {
        bg_color = "#1d2021",
        fg_color = "#a9b665",
      },
      inactive_tab = {
        bg_color = "#1d2021",
        fg_color = "#d4be98",
      },
      new_tab = {
        bg_color = "#1d2021",
        fg_color = "#d4be98",
      },
      inactive_tab_edge = "#1d2021",
    },
  },
  command_palette_bg_color = "#1d2021",
  command_palette_fg_color = "#d4be98",
  default_cursor_style = "BlinkingUnderline",
  font = font(),
  font_size = 12,
  font_rules = {
    { italic = true, font = font() },
    { intensity = "Bold", font = font() },
  },
  freetype_load_target = "Light",
  front_end = "WebGpu",
  line_height = 1.3,
  native_macos_fullscreen_mode = true,
  send_composed_key_when_left_alt_is_pressed = true,
  send_composed_key_when_right_alt_is_pressed = false,
  window_decorations = "RESIZE",
  window_frame = {
    active_titlebar_bg = "#1d2021",
    inactive_titlebar_bg = "#1d2021",
    font = font(),
    font_size = 12,
  },
  window_padding = {
    left = "1cell",
    right = "1cell",
    top = "0.5cell",
    bottom = "0cell",
  },
}

return config
