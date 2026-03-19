local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- Import modules
local basic = require("config.basic")
local colors = require("config.colors")
-- local keys = require("config.keys")
local tabline = require("config.tabline")
local window = require("config.window")
--
-- -- Setup modules
basic.setup(config)
colors.setup(config)
-- keys.setup(config, act)
tabline.setup(config)
window.setup(config)
--
wezterm.on("toggle-colorscheme", function(window, pane)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	local overrides = window:get_config_overrides() or {}
	local scheme_names = {}
	for name, _ in pairs(config.color_schemes) do
		table.insert(scheme_names, name)
	end
	table.sort(scheme_names)

	local current_scheme_name = overrides.color_scheme or config.color_scheme
	local current_index = 1 -- Default to the first scheme
	for i, name in ipairs(scheme_names) do
		if name == current_scheme_name then
			current_index = i
			break
		end
	end
	window:gui_window():set_position(110, 110)

	-- Use modulo arithmetic for clean wrapping
	local next_index = (current_index % #scheme_names) + 1
	local next_scheme_name = scheme_names[next_index]

	overrides.color_scheme = next_scheme_name
	window:set_config_overrides(overrides)
end)

return config
