local wezterm = require("wezterm")

local M = {}

function M.setup(config)
	local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
	tabline.setup({
		options = {
			theme = "Grayscale Dark (base16)",
			icons_enabled = true,
			tabs_enabled = true,
			theme_overrides = {},
			section_separators = {
				left = wezterm.nerdfonts.pl_left_hard_divider,
				right = wezterm.nerdfonts.pl_right_hard_divider,
			},
			component_separators = {
				left = wezterm.nerdfonts.pl_left_soft_divider,
				right = wezterm.nerdfonts.pl_right_soft_divider,
			},
			tab_separators = {
				left = wezterm.nerdfonts.pl_left_hard_divider,
				right = wezterm.nerdfonts.pl_right_hard_divider,
			},
		},
		sections = {
			tabline_a = { nvim_mode_component, "Artemis", icons_enabled = true, padding = 1 },
			-- tabline_b = { "window" },
			tabline_c = {
				{ Attribute = { Underline = "Single" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Background = { Color = "blue" } },
			},
			tab_active = {
				"index",
				-- { "parent", padding = 0 },

				{ "parent", padding = { left = 0, right = 1 } },
				{ "zoomed", padding = 0 },
			},
			tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
			tabline_x = { "" },
			tabline_y = { "datetime" },
			tabline_z = {
				"domain",
				domain_to_icon = {
					default = wezterm.nerdfonts.md_monitor,
					ssh = wezterm.nerdfonts.md_ssh,
					wsl = wezterm.nerdfonts.md_microsoft_windows,
					docker = wezterm.nerdfonts.md_docker,
					unix = wezterm.nerdfonts.cod_terminal_linux,
				},
			},
		},
		extensions = {},
	})
end

return M
