local wezterm = require("wezterm")

local M = {}

function M.setup(config, act)
	config.keys = {
		{
			key = "P",
			mods = "CTRL",
			action = wezterm.action.ActivateCommandPalette,
		},
		{
			key = "E",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action.EmitEvent("toggle-colorscheme"),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action.SplitPane({
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{
			key = "v",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action.SplitPane({
				direction = "Down",
				size = { Percent = 50 },
			}),
		},
		{
			key = "U",
			mods = "CTRL|SHIFT",
			action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
		},
		{
			key = "I",
			mods = "CTRL|SHIFT",
			action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
		},
		{
			key = "O",
			mods = "CTRL|SHIFT",
			action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
		},
		{
			key = "P",
			mods = "CTRL|SHIFT",
			action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
		},
		{ key = "9", mods = "CTRL", action = act.PaneSelect },
		{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
		{
			key = "O",
			mods = "CTRL|ALT",
			-- toggling opacity
			action = wezterm.action_callback(function(window, _)
				local overrides = window:get_config_overrides() or {}
				if overrides.window_background_opacity == 1.0 then
					overrides.window_background_opacity = 0.9
				else
					overrides.window_background_opacity = 1.0
				end
				window:set_config_overrides(overrides)
			end),
		},
		-- Window size adjustment shortcuts
		{
			key = "h",
			mods = "CTRL|ALT",
			action = wezterm.action_callback(function(window, pane)
				local dimensions = window:get_dimensions()
				dimensions.width = dimensions.width - 50
				window:set_dimensions(dimensions)
			end),
		},
		{
			key = "l",
			mods = "CTRL|ALT",
			action = wezterm.action_callback(function(window, pane)
				local dimensions = window:get_dimensions()
				dimensions.width = dimensions.width + 50
				window:set_dimensions(dimensions)
			end),
		},
		{
			key = "k",
			mods = "CTRL|ALT",
			action = wezterm.action_callback(function(window, pane)
				local dimensions = window:get_dimensions()
				dimensions.height = dimensions.height - 50
				window:set_dimensions(dimensions)
			end),
		},
		{
			key = "j",
			mods = "CTRL|ALT",
			action = wezterm.action_callback(function(window, pane)
				local dimensions = window:get_dimensions()
				dimensions.height = dimensions.height + 50
				window:set_dimensions(dimensions)
			end),
		},
	}
end

return M
