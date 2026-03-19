local wezterm = require("wezterm")
local M = {}

function M.setup(config)
	config.color_schemes = wezterm.color.get_builtin_schemes()
	config.color_scheme = "Gruvbox Dark"

	config.colors = {
		background = "#1d2021",
		foreground = "#ebdbb2",

		cursor_bg = "#fabd2f",
		cursor_fg = "#1d2021",
		cursor_border = "#fabd2f",

		selection_bg = "#3c3836",
		selection_fg = "#ebdbb2",

		tab_bar = {
			background = "#1d2021",

			active_tab = {
				bg_color = "#fabd2f",
				fg_color = "#1d2021",
				intensity = "Bold",
			},

			inactive_tab = {
				bg_color = "#3c3836",
				fg_color = "#a89984",
			},

			inactive_tab_hover = {
				bg_color = "#504945",
				fg_color = "#ebdbb2",
			},

			new_tab = {
				bg_color = "#3c3836",
				fg_color = "#a89984",
			},

			new_tab_hover = {
				bg_color = "#504945",
				fg_color = "#ebdbb2",
			},
		},
	}

	config.window_background_gradient = {
		colors = {
			"#1d2021",
			"#1d2021",
		},
		blend = "LinearRgb",
	}
end

return M
