local wezterm = require("wezterm")
return {
	color_scheme = "tokyonight_storm",
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
		{ key = "LeftArrow", mods = "OPT|CMD", action = wezterm.action.ActivateTabRelative(-1) },
		{ key = "RightArrow", mods = "OPT|CMD", action = wezterm.action.ActivateTabRelative(1) },
		{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.MoveTabRelative(-1) },
		{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.MoveTabRelative(1) },
		{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	},
	line_height = 1.1,
	send_composed_key_when_left_alt_is_pressed = true,
	send_composed_key_when_right_alt_is_pressed = false,
	window_decorations = "RESIZE",
	window_frame = {
		active_titlebar_bg = "#24283b",
		active_titlebar_border_bottom = "#24283b",
		button_bg = "#1b1b1b",
		font = wezterm.font("Lekton"),
		font_size = 13,
		inactive_titlebar_border_bottom = "#24283b",
	},
	window_padding = {
		left = "1cell",
		right = "1cell",
		top = "0.5cell",
		bottom = "0cell",
	},
}
