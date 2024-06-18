local wezterm = require("wezterm")
local act = wezterm.action
return {
  color_scheme = "tokyonight_storm",
  colors = {
    tab_bar = {
      active_tab = {
        bg_color = "#393d4e",
        fg_color = "#a9b1d6",
      },
      inactive_tab = {
        bg_color = "#24283b",
        fg_color = "#959cbd",
      },
      new_tab = {
        bg_color = "#24283b",
        fg_color = "#959cbd",
      },
      inactive_tab_edge = "#24283b",
    },
  },
  default_cursor_style = "BlinkingUnderline",
  font = wezterm.font_with_fallback({
    { family = "JuliaMono", weight = "Light", assume_emoji_presentation = false },
    { family = "JetBrains Mono", weight = "Regular" },
  }),
  font_size = 12,
  font_rules = {
    {
      italic = true,
      font = wezterm.font_with_fallback({
        { family = "JuliaMono", weight = "Light", style = "Normal", assume_emoji_presentation = false },
        { family = "JetBrains Mono", weight = "Regular", style = "Normal" },
      }),
    },
  },
  front_end = "WebGpu",
  keys = {
    { key = ":", mods = "LEADER", action = act.ActivateCommandPalette },
    { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
    { key = "<", mods = "LEADER", action = act.ActivateTabRelative(-1) },
    { key = ">", mods = "LEADER", action = act.ActivateTabRelative(1) },
    { key = "LeftArrow", mods = "CTRL|SHIFT", action = act.MoveTabRelative(-1) },
    { key = "RightArrow", mods = "CTRL|SHIFT", action = act.MoveTabRelative(1) },
    { key = "|", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
    { key = "q", mods = "LEADER", action = act.PaneSelect },
    { key = "h", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 4 }) },
    { key = "j", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 4 }) },
    { key = "k", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 4 }) },
    { key = "l", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 4 }) },
    { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
    { key = "&", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
  },
  leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
  line_height = 1.1,
  native_macos_fullscreen_mode = true,
  send_composed_key_when_left_alt_is_pressed = true,
  send_composed_key_when_right_alt_is_pressed = false,
  window_decorations = "RESIZE",
  window_frame = {
    active_titlebar_bg = "#24283b",
    font = wezterm.font("Lekton"),
    font_size = 13,
  },
  window_padding = {
    left = "1cell",
    right = "1cell",
    top = "0.5cell",
    bottom = "0cell",
  },
}
