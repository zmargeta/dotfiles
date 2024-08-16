local _LEADER = { key = "a", mods = "CTRL" }
local _PANE_RESIZE = 5

local wezterm = require("wezterm")
local act = wezterm.action
local custom_act = require("actions")

local config = {
  color_scheme = "tokyonight_storm",
  colors = {
    tab_bar = {
      active_tab = {
        bg_color = "#3b4261",
        fg_color = "#82aaff",
      },
      inactive_tab = {
        bg_color = "#1f2335",
        fg_color = "#828bb8",
      },
      new_tab = {
        bg_color = "#1f2335",
        fg_color = "#959cbd",
      },
      inactive_tab_edge = "#24283b",
    },
  },
  command_palette_bg_color = "#3b4261",
  command_palette_fg_color = "#82aaff",
  default_cursor_style = "BlinkingUnderline",
  disable_default_key_bindings = true,
  font = wezterm.font_with_fallback({
    { family = "Lilex", weight = "ExtraLight", harfbuzz_features = { "zero", "cv09", "cv10", "ss02", "cv11" } },
    { family = "JetBrains Mono", weight = "Regular" },
  }),
  font_size = 12,
  font_rules = {
    {
      italic = true,
      font = wezterm.font_with_fallback({
        {
          family = "Lilex",
          weight = "ExtraLight",
          style = "Normal",
          harfbuzz_features = { "zero", "cv09", "cv10", "ss02", "cv11" },
        },
        { family = "JetBrains Mono", weight = "Regular", style = "Normal" },
      }),
    },
    {
      intensity = "Bold",
      font = wezterm.font_with_fallback({
        {
          family = "Lilex",
          weight = "ExtraLight",
          style = "Normal",
          harfbuzz_features = { "zero", "cv09", "cv10", "ss02", "cv11" },
        },
        { family = "JetBrains Mono", weight = "Regular", style = "Normal" },
      }),
    },
  },
  freetype_load_target = "Light",
  front_end = "WebGpu",
  keys = {
    -- General
    { key = _LEADER.key, mods = "LEADER|" .. _LEADER.mods, action = act.SendKey(_LEADER) },
    { key = ":", mods = "LEADER", action = act.ActivateCommandPalette },
    { key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
    { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
    { key = "l", mods = "CTRL|SHIFT", action = act.ShowDebugOverlay },
    -- Workspaces
    { key = "s", mods = "LEADER", action = custom_act.WorkspaceSelect },
    { key = "$", mods = "LEADER", action = custom_act.RenameWorkspace },
    { key = "(", mods = "LEADER", action = act.SwitchWorkspaceRelative(-1) },
    { key = ")", mods = "LEADER", action = act.SwitchWorkspaceRelative(1) },
    -- Tabs
    { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
    { key = "&", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
    { key = "<", mods = "LEADER", action = act.ActivateTabRelative(-1) },
    { key = ">", mods = "LEADER", action = act.ActivateTabRelative(1) },
    { key = "f", mods = "LEADER", action = act.MoveTabRelative(-1) },
    { key = "b", mods = "LEADER", action = act.MoveTabRelative(1) },
    { key = "r", mods = "LEADER", action = act.ActivateLastTab },
    -- Panes
    { key = "|", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
    { key = "q", mods = "LEADER", action = act.PaneSelect },
    { key = "!", mods = "LEADER", action = custom_act.MovePaneToNewTab },
    { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
    { key = "{", mods = "LEADER", action = act.RotatePanes("CounterClockwise") },
    { key = "}", mods = "LEADER", action = act.RotatePanes("Clockwise") },
    { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "h", mods = "LEADER|CTRL", action = act.ActivatePaneDirection("Left") },
    { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
    { key = "j", mods = "LEADER|CTRL", action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "k", mods = "LEADER|CTRL", action = act.ActivatePaneDirection("Up") },
    { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
    { key = "l", mods = "LEADER|CTRL", action = act.ActivatePaneDirection("Right") },
    {
      key = "h",
      mods = "LEADER|SHIFT",
      action = act.Multiple({
        act.AdjustPaneSize({ "Left", _PANE_RESIZE }),
        act.ActivateKeyTable({ name = "resize_pane", one_shot = false, until_unknown = true }),
      }),
    },
    {
      key = "j",
      mods = "LEADER|SHIFT",
      action = act.Multiple({
        act.AdjustPaneSize({ "Down", _PANE_RESIZE }),
        act.ActivateKeyTable({ name = "resize_pane", one_shot = false, until_unknown = true }),
      }),
    },
    {
      key = "k",
      mods = "LEADER|SHIFT",
      action = act.Multiple({
        act.AdjustPaneSize({ "Up", _PANE_RESIZE }),
        act.ActivateKeyTable({ name = "resize_pane", one_shot = false, until_unknown = true }),
      }),
    },
    {
      key = "l",
      mods = "LEADER|SHIFT",
      action = act.Multiple({
        act.AdjustPaneSize({ "Right", _PANE_RESIZE }),
        act.ActivateKeyTable({ name = "resize_pane", one_shot = false, until_unknown = true }),
      }),
    },
    -- Copy Mode
    { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
    -- Quick Select Mode
    { key = " ", mods = "SHIFT|CTRL", action = act.QuickSelect },
  },
  key_tables = {
    resize_pane = {
      { key = "h", mods = "SHIFT", action = act.AdjustPaneSize({ "Left", _PANE_RESIZE }) },
      { key = "j", mods = "SHIFT", action = act.AdjustPaneSize({ "Down", _PANE_RESIZE }) },
      { key = "k", mods = "SHIFT", action = act.AdjustPaneSize({ "Up", _PANE_RESIZE }) },
      { key = "l", mods = "SHIFT", action = act.AdjustPaneSize({ "Right", _PANE_RESIZE }) },
      { key = "Escape", mods = "NONE", action = act.PopKeyTable },
    },
    copy_mode = {
      { key = "y", mods = "NONE", action = custom_act.CopyMode("CopyToClipboard") },
      { key = "Escape", mods = "NONE", action = custom_act.CopyMode("Close") },
      { key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
      { key = "v", mods = "SHIFT", action = act.CopyMode({ SetSelectionMode = "Line" }) },
      { key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
      { key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
      { key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
      { key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
      { key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
      { key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
      { key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
      { key = "e", mods = "NONE", action = act.CopyMode("MoveForwardWordEnd") },
      { key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
      { key = ",", mods = "NONE", action = act.CopyMode("JumpReverse") },
      { key = ";", mods = "NONE", action = act.CopyMode("JumpAgain") },
      { key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
      { key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
      { key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
      { key = "g", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
      { key = "h", mods = "SHIFT", action = act.CopyMode("MoveToViewportTop") },
      { key = "m", mods = "SHIFT", action = act.CopyMode("MoveToViewportMiddle") },
      { key = "l", mods = "SHIFT", action = act.CopyMode("MoveToViewportBottom") },
      { key = "b", mods = "CTRL", action = act.ScrollByPage(-1.0) },
      { key = "u", mods = "CTRL", action = act.ScrollByPage(-0.5) },
      { key = "f", mods = "CTRL", action = act.ScrollByPage(1.0) },
      { key = "d", mods = "CTRL", action = act.ScrollByPage(0.5) },
      { key = "/", mods = "NONE", action = custom_act.CopyMode("SearchForward") },
      { key = "?", mods = "NONE", action = custom_act.CopyMode("SearchBackward") },
      { key = "n", mods = "NONE", action = custom_act.CopyMode("NextMatch") },
      { key = "n", mods = "SHIFT", action = custom_act.CopyMode("PriorMatch") },
    },
    search_mode = {
      { key = "y", mods = "NONE", action = custom_act.CopyMode("CopyToClipboard") },
      { key = "Enter", mods = "NONE", action = custom_act.CopyMode("AcceptPattern") },
      { key = "Escape", mods = "NONE", action = custom_act.CopyMode("ClearPattern") },
    },
  },
  leader = _LEADER,
  line_height = 1.3,
  native_macos_fullscreen_mode = true,
  send_composed_key_when_left_alt_is_pressed = true,
  send_composed_key_when_right_alt_is_pressed = false,
  window_decorations = "RESIZE",
  window_frame = {
    active_titlebar_bg = "#1f2335",
    inactive_titlebar_bg = "#1f2335",
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

for i = 1, 9 do
  table.insert(config.keys, { key = tostring(i), mods = "LEADER", action = act.ActivateTab(i - 1) })
end

return config
