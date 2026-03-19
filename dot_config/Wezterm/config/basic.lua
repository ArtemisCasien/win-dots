local wezterm = require("wezterm")

local M = {}

function M.setup(config)
	config.font_size = 16
	config.font = wezterm.font_with_fallback({
		-- { family = "IosevkaTerm Nerd Font" },
		-- { family = "CaskaydiaMono Nerd Font" },
		{ family = "BlexMono Nerd Font" },
		-- { family = "0xProto Nerd Font" },
		-- { family = "JetBrains Mono" },
	})
	config.underline_position = "-5pt"
	config.harfbuzz_features = {
		"calt",
		"clig",
		"dlig",
		"liga",
		"ss01",
		"ss02",
		"ss03",
		"ss04",
		"ss05",
		"ss06",
		"ss07",
		"ss08",
	}
	config.warn_about_missing_glyphs = false
	config.enable_wayland = true

	config.automatically_reload_config = true
	config.inactive_pane_hsb = {
		saturation = 0.5,
		brightness = 1,
	}
	config.term = "xterm-256color"
	config.front_end = "OpenGL"
	config.prefer_egl = true
end

return M
